import numpy as np
import modern_robotics as mr
""" Helper functions"""


# Create a 3x3 rotation matrix
def rot(axis, angle, vect=None, matrix=None):
    I = np.eye(3)
    skew = mr.VecToso3(axis)
    rotated = I + np.sin(angle) * skew + (1 - np.cos(angle)) * np.matmul(skew, skew)
    if vect != None:
        rotated = rotated * vect
    elif matrix != None:
        rotated = rotated * matrix
    return rotated

"""
from enum import Enum
class Colour(Enum):
    RED = 0
    GREEN = 1
    BLUE = 2
    YELLOW = 3
    UNKNOWN = 4

class ClawPose:
    position = [0., 0., 0., 0.]

class CubePose:
    position = [0., 0., 0., 0.]
    colour = Colour.RED

class CurrentJointState:
    thetas = [0., 0., 0., 0., 0.]
    
"""

"""
This script primarily focuses on the transformations, kinematics and inverse
kinematics of the robot arm for METR4202. The following robot has the following
parts 

Part        | Elements              | Description       
-------------------------------------------------------
origin      |                       | Located at the bottom of the slew axis of rotation
armA        | frame{1} S1 theta1 z1 | The largest link. Associated with joint1
armB        | frame{2} S2 theta2 y2 | Adjacent to armA. Associated with joint2
couple      | frame{3} S3 theta3 y3 | Connects armB to claw. Associated with claw orientation
claw        | frame{4} S4 theta4 z4 | End of the robot arm. Associated with claw height
cube        | frame{5} S5           | cube to pick up 
camera      | frame{6} S6 z6        | camera mounted on armA
"""


class FK_Ibis:
    def __init__(self):
        self.initialise_robot_parameters()

        ## Claw pose ##
        # Initialize node
        rospy.init_node('Forward_Kinematics', anonymous=True)
        # Create publisher
        self.clawPosePub = rospy.Publisher('FK_ClawPose', ClawPose, queue_size=1)
        # Create subscriber
        self.actuatorSub = rospy.Subscriber('Actuator_CurrentJS', CurrentJointState, self.cb_calculate_claw_pose)

        ## Cube pose ##
        # Publish
        self.cubePosePub = rospy.Publisher('FK_CubePose', CubePose, queue_size=1)
        # Subscribe
        self.cubePoseSub = rospy.Subscriber('Camera_Pose', CubePose, self.cb_calculate_cube_pose)

    def initialise_robot_parameters(self):
        """ Model parameters """
        self.theta1_home_offset = (157.33 + 90) * (
                np.pi / 180)  # rad - this is the home angle of the arm relative to the frame {1} x axis
        self.claw_angle_offset = -15 * (np.pi / 180)  # rad - offset angle for claw relative to armB {2}
        self.z1 = 114.  # mm height of the slew joint {1} from origin
        self.armA_l = 185.  # mm length of armA
        self.armB_l = 140.  # mm length of armB
        self.z4 = 10  # mm height of claw
        self.r_6 = np.array([29.104, -29.104, 285.589])  # mm position of camera relative to frame{0}
        self.PITCH = 1.  # For the vertical axis, joint 4
        self.camera_tilt = 63 * np.pi / 180  # tilt angle of the camera {6}

        # Create the initial transformation and screws for all joint frames
        self.T0_1, self.T0_2, self.T1_2, self.T2_3, self.T3_4, self.T6_5, self.T1_6 \
            = np.zeros((7, 4, 4))

        # Joint angles in radians. This includes a joint that does not exist in the first position
        # thetas[0] is not a real joint. Used to so that index number is same as joint number.
        self.thetas = np.array([0., 0., 0., 0., 0., 0.])

        # Rotational matrices for the camera frame
        self.R1Z = np.array([[0, 0, 1],
                             [1, 0, 0],
                             [0, 1, 0]])  # z aligns with the x axis
        self.RZY = rot(np.array([0, 1, 0]), -1 * np.pi / 4)  # rotate around the y axis
        self.RY6 = rot(np.array([1, 0, 0]), self.camera_tilt)  # rotate around the body x axis
        self.R16 = self.R1Z @ self.RZY @ self.RY6

        self.calculate_transformation_matrices()
        # End effector position relative to home
        self.M = self.T0_1 @ self.T1_2 @ self.T2_3 @ self.T3_4

        # Frame distance from origin
        q1 = np.array([0, 0, self.z1])
        q2 = np.array([self.armA_l * np.cos(self.theta1_home_offset),
                       self.armA_l * np.sin(self.theta1_home_offset),
                       self.z1])
        q3 = np.array([(self.armA_l + self.armB_l) * np.cos(self.theta1_home_offset),
                       (self.armA_l + self.armB_l) * np.sin(self.theta1_home_offset),
                       self.z1])

        # Skew axis representation of rotation about z axis
        wz_skew = mr.VecToso3(np.array([0, 0, 1]))

        # Velocity vectors
        v1 = np.dot(-1 * wz_skew, q1)
        v2 = np.dot(-1 * wz_skew, q2)
        v3 = np.dot(-1 * wz_skew, q3)
        v4 = np.array([0, 0, self.PITCH])  # translation along z axis

        # Screws of each joint
        S1 = np.block([np.array([0, 0, 1]), v1])
        S2 = np.block([np.array([0, 0, 1]), v2])
        S3 = np.block([np.array([0, 0, 1]), v3])
        S4 = np.block([np.array([0, 0, 0]), v4])
        self.screws = np.array([S1, S2, S3, S4])

    def cb_calculate_claw_pose(self, msg):
        self.thetas[1:] = np.array(msg.thetas)
        self.calculate_transformation_matrices() # For cube pose calculation
        T0_4 = mr.FKinSpace(self.M, self.screws.T, self.thetas[1:self.thetas.size - 1])  # Transformation of claw
        clawPose = ClawPose()
        clawPose.position = [T0_4[0][3],  # x
                             T0_4[1][3],  # y
                             T0_4[2][3],  # z
                             np.arccos(T0_4[0][0])]  # theta_z
        #print(clawPose.position)
        self.clawPosePub.publish(clawPose)

    def cb_calculate_cube_pose(self, msg):
        self.R6_5 = rot(np.array([0, 0, 1]), msg.position[3])
        self.r6_5 = np.array([[msg.position[0],
                              msg.position[1],
                              msg.position[2]]])
        self.T6_5 = np.concatenate((self.R6_5, np.transpose(self.r6_5)), axis=1)
        self.T6_5 = np.concatenate((self.T6_5, np.array([[0, 0, 0, 1]])), axis=0)

        T0_5 = self.T0_6 @ self.T6_5

        cubePose = CubePose()
        cubePose.position = [T0_5[0][3],
                             T0_5[1][3],
                             T0_5[2][3],
                             np.arccos(T0_5[0][0])]
        #print(cubePose.position)
        self.cubePosePub.publish(cubePose)

    def calculate_transformation_matrices(self):
        # Relative transformation matrices
        self.R1 = rot(np.array([0, 0, 1]), self.thetas[1] + self.theta1_home_offset)
        self.T0_1 = mr.RpToTrans(self.R1, np.array([0, 0, self.z1]))  # origin to armA joint
        self.R2 = rot(np.array([0, 0, 1]), self.thetas[2])
        self.T1_2 = mr.RpToTrans(self.R2, np.array([self.armA_l, 0, 0]))  # armA joint to armB joint
        self.R3 = rot(np.array([0, 0, 1]), self.thetas[3] + self.claw_angle_offset)
        self.T2_3 = mr.RpToTrans(self.R3, np.array([self.armB_l, 0, 0]))  # armB joint to claw orientation
        self.R4 = rot(np.array([0, 0, 1]), 0)
        self.T3_4 = mr.RpToTrans(self.R4, np.array([0, 0, (self.z4 - self.z1) +
                                                    self.PITCH * self.thetas[4]]))

        self.T1_6 = mr.RpToTrans(self.R16, self.r_6 - np.array([0, 0, self.z1]))  # Camera pose relative to frame {1}
        self.T0_6 = self.T0_1 @ self.T1_6

    def test_camera_transforms(self):
        # searching position
        msg = CubePose()
        self.thetas = np.array([0., (-157.33 + 45) * np.pi / 180, 0., 0., 0., 0.])
        self.calculate_transformation_matrices()

        msg.position = [0., 7.504, 313.124, 0]
        print(f"Camera cube position = {msg.position}")
        self.cb_calculate_cube_pose(msg)
        msg.position = [150, -210.878, 213.077, 0]
        print(f"Camera cube position = {msg.position}")
        self.cb_calculate_cube_pose(msg)
        msg.position = [-100, -88.207, 219.464, 0]
        print(f"Camera cube position = {msg.position}")
        self.cb_calculate_cube_pose(msg)

    def test_claw_FK(self):
        msg = CurrentJointState()
        msg.thetas = [0., 0., 0., 0., 0.]
        print(f"Joint angles \t{msg.thetas[1:]}")
        self.cb_calculate_claw_pose(msg)
        msg.thetas = [0., 0., 0., np.pi / 2, 0.]
        print(f"Joint angles \t{msg.thetas[1:]}")
        self.cb_calculate_claw_pose(msg)
        msg.thetas = [0., 0., -np.pi / 2, np.pi / 2, 0.]
        print(f"Joint angles \t{msg.thetas[1:]}")
        self.cb_calculate_claw_pose(msg)
        msg.thetas = [0., np.pi / 2, 0., -np.pi / 2, 0.]
        print(f"Joint angles \t{msg.thetas[1:]}")
        self.cb_calculate_claw_pose(msg)
        msg.thetas = [0., 0., 0., 0., 80]
        print(f"Joint angles \t{msg.thetas[1:]}")
        self.cb_calculate_claw_pose(msg)

if __name__ == '__main__':
    #np.set_printoptions(precision=2, suppress=True)
    #fk_ibis = FK_Ibis()
    #fk_ibis.test_claw_FK()
    #fk_ibis.test_camera_transforms()

    try:
        FK_Ibis()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

