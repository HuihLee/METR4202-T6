import numpy as np
import modern_robotics as mr
from enum import Enum

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
    """ Model parameters """
    thetaHomeOffset = (157.33 + 90) * (np.pi / 180)  # rad - this is the home angle of the arm relative to the x axis
    clawAngleOffset = -15 * (np.pi / 180) # rad - offset angle for claw relative to armB
    z1 = 114. # mm height of the slew joint from origin
    armA_l = 185. # mm length of armA
    armB_l = 140. # mm length of armB
    z4 = 10 # mm height of claw
    r_6  = np.array([29.104, 29.104, 285.589]) # mm position of camera relative to frame{0}
    PITCH = 1. # For the vertical axis, joint 4

    """ Create the initial transformation and screws for all joint frames """
    T0_1, T0_2, T1_2, T2_3, T3_4, T6_5, T1_6 = np.zeros((7, 4, 4))

    # Joint angles in radians. This includes a joint that does not exist in the first position
    thetas = np.array([0., 0., 0., 0., 0.]) # thetas[0] is not a real joint. Used to so that index number is same as joint number.

    # Relative transformation matrices
    R1 = rot(np.array([0, 0, 1]), thetas[1] + thetaHomeOffset)
    T0_1 = mr.RpToTrans(R1, np.array([0, 0, z1])) # origin to armA joint
    R2 = rot(np.array([0, 0, 1]), thetas[2])
    T1_2 = mr.RpToTrans(R2, np.array([armA_l, 0, 0])) # armA joint to armB joint
    R3 = rot(np.array([0, 0, 1]), thetas[3] + clawAngleOffset)
    T2_3 = mr.RpToTrans(R3, np.array([armB_l, 0, 0])) # armB joint to claw orientation
    R4 = rot(np.array([0, 0, 1]), 0)
    T3_4 = mr.RpToTrans(R4, np.array([0, 0, (z4 - z1) + PITCH * thetas[4]]))
    R1Z = np.array([[0, 0, 1],
                    [1, 0, 0],
                    [0, 1, 0]]) # z aligns with the x axis
    RZY = rot(np.array([1, 0, 0]), np.pi * 1 / 3) # rotate around the body x axis
    RY6 = rot(np.array([0, 1, 0]), -1 * np.pi / 4) # rotate around the y axis
    R06 = R1Z @ RZY @ RY6
    T1_6 = mr.RpToTrans(R06, r_6 - np.array([0, 0, z1])) # Camera pose relative to frame {1}

    T0_6 = T0_1 @ T1_6

    # End effector position relative to home
    M = T0_1 @ T1_2 @ T2_3 @ T3_4
    print(f"Home position \n{M}\nHome angle cos({thetaHomeOffset + clawAngleOffset}) = "
          f"{np.cos(thetaHomeOffset + clawAngleOffset)}\n")

    # Frame distance from origin
    q1 = np.array([0, 0, z1])
    q2 = np.array([armA_l * np.cos(thetaHomeOffset), armA_l * np.sin(thetaHomeOffset), z1])
    q3 = np.array([(armA_l + armB_l) * np.cos(thetaHomeOffset), (armA_l + armB_l) * np.sin(thetaHomeOffset), z1])
    # q4 = np.array([(armA_l + armB_l) * np.cos(thetaHomeOffset), (armA_l + armB_l) * np.sin(thetaHomeOffset), z4])

    # Skew axis representation of rotation about z axis
    wz_skew = mr.VecToso3(np.array([0, 0, 1]))

    # Velocity vectors
    v1 = np.dot(-1 * wz_skew, q1)
    v2 = np.dot(-1 * wz_skew, q2)
    v3 = np.dot(-1 * wz_skew, q3)
    v4 = np.array([0, 0, PITCH])  # translation along z axis

    # Screws of each joint
    S1 = np.block([np.array([0, 0, 1]), v1])
    S2 = np.block([np.array([0, 0, 1]), v2])
    S3 = np.block([np.array([0, 0, 1]), v3])
    S4 = np.block([np.array([0, 0, 0]), v4])
    Screws = np.array([S1, S2, S3, S4])

    def __init__(self):
        """ Claw pose """
        # Initialize node
        rospy.init_node('Forward_Kinematics', anonymous=True)
        # Create publisher
        self.clawPosePub = rospy.Publisher('FK_ClawPose', ClawPose, queue_size=2)
        # Create subscriber
        self.actuatorSub = rospy.Subscriber('Actuator_CurrentJS', CurrentJointState, self.cb_calculate_claw_pose)

        """ Cube pose """
        # Publish
        self.cubePosePub = rospy.Publisher('FK_CubePose', CubePose, queue_size=2)
        # Subscribe
        self.cubePoseSub = rospy.Subscriber('Camera_Pose', CubePose, self.cb_calculate_cube_pose)

    def calculate_claw_pose(self, msg):
        self.thetas = np.array(msg.thetas)
        T0_4 = mr.FKinSpace(self.M, self.Screws.T, self.thetas) # Transformation of claw
        clawPose = ClawPose()
        clawPose.position = [T0_4[0][3],  # x
                             T0_4[1][3],  # y
                             T0_4[2][3],  # z
                             np.arccos(T0_4[0][0])] # theta_z
        self.clawPosePub.publish(clawPose)

    def calculate_cube_pose(self, msg):
        R6_5 = rot(np.array([0, 0, 1]), msg.position[3])
        r6_5 = np.array([msg.position[0],
                         msg.position[1],
                         msg.position[2]])
        T6_5 = np.concatenate((R6_5, r6_5), axis=1)
        T6_5 = np.concatenate((T6_5, np.array([0, 0, 0, 1])), axis=0)

        T0_5 = self.T_0_6 @ T6_5

        cubePose = CubePose()
        cubePose.position = [T0_5[0][3],
                             T0_5[1][3],
                             T0_5[2][3],
                             np.arccos(T0_5[0][0])]


        self.cubePosePub.publish(cubePose)

if __name__ == '__main__':
    try:
        FK_Ibis()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass