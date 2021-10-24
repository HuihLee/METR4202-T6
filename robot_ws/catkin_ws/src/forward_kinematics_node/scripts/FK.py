#!/usr/bin/env python3
import rospy
import numpy as np
import modern_robotics as mr
from control_logic_node.msg import CubePose, ClawPose, CurrentJointState
""" Helper functions"""

# 0, -7.504, 313.124 -> 0, 190, 10
# -150, 210.878, 213.077 -> -50, -150, 0
# 100, 88, 219.464 -> 100, 62.2, 50

class CubePoseClass:
    position = [0., 0., 0., 0.]
    colour = "RED"

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

    """callbacks"""
    def cb_calculate_claw_pose(self, msg):
        self.thetas[1:] = np.array(msg.thetas)
        self.calculate_transformation_matrices() # For cube pose calculation

    def cb_calculate_cube_pose(self, msg):
        self.calculate_transformation_matrices()

        # Make a transformation matrix that represents the cube's position
        # relative to the camera
        R6_5 = rot(np.array([0, 0, 1]), 0)
        cube6_5 = np.array([[msg.position[0]],
                              [msg.position[1]],
                              [msg.position[2]]])
   
        self.T6_5 = np.concatenate((R6_5, cube6_5), axis=1)
        self.T6_5 = np.append(self.T6_5, [[0, 0, 0, 1]], axis=0)
    

        # Transform the pose of the cube from the camera to the origin frame
        self.T0_5 = self.T0_6 @ self.T6_5
  

        cubePose = CubePose()
        cubePose.position = [self.T0_5[0][3],
                             self.T0_5[1][3],
                             self.T0_5[2][3],
                             msg.position[3] + np.pi/4 - self.theta1_home_offset - self.thetas[1]] # TODO fix orientation
        cubePose.colour = msg.colour
        rospy.logerr(cubePose)
        self.cubePosePub.publish(cubePose)
        #return cubePose


    def apply_workspace_limits(self, position):
        # Ensure that the calculated pose is within the allowable workspace in the xy plane
        
        x = T0_5[0][3]
        y = T0_5[1][3]
        
        errorFlag = 0
        
        if y < self.workspace_lower_limit[1]:
            T0_5[1][3] = self.workspace_lower_limit[1]
            errorFlag = 1
        elif y > self.workspace_upper_limit[1]:
            T0_5[1][3] = self.workspace_upper_limit[1]
            errorFlag = 1
        elif x < self.workspace_lower_limit[0]:
            T0_5[0][3] = self.workspace_lower_limit[0]
            errorFlag = 1
        elif x > self.workspace_upper_limit[0]:
            T0_5[0][3] = self.workspace_upper_limit[0]
            errorFlag = 1
        
        if errorFlag:
            rospy.logerr("Error keeping block in workspace...")
        
        for coordinate in range(2):
            value = T0_5[coordinate][3]
            
        """   
            # check the positive range
            if value >= 0:
                # Check the lower range
                if value < self.workspace_lower_limit[coordinate]:
                    value = self.workspace_lower_limit[coordinate]
                # Check the upper range
                elif value > self.workspace_upper_limit[coordinate]:
                    value = self.workspace_upper_limit[coordinate]
            # check the positive range
            elif value < 0:
                # Check the lower range
                if value > -self.workspace_lower_limit[coordinate]:
                    value = -self.workspace_lower_limit[coordinate]
                # Check the upper range
                elif value < -self.workspace_upper_limit[coordinate]:
                    value = -self.workspace_upper_limit[coordinate]
            value = T0_5[coordinate][3]
        """
        # Ensure that the vertical position is within the allowable workspace
        if T0_5[2][3] < self.workspace_lower_limit[2]:
            T0_5[2][3] = self.workspace_lower_limit[2]
        elif T0_5[2][3] > self.workspace_upper_limit[2]:
            T0_5[2][3] = self.workspace_upper_limit[2]


    """"""
    def __init__(self):
        self.workspace_lower_limit = [80, 80, 10]
        self.workspace_upper_limit = [310, 310, 100]
        
        self.initialise_robot_parameters()

        ## Claw pose ##
        # Initialize node
        rospy.init_node('Forward_Kinematics', anonymous=True, log_level=rospy.DEBUG)
        rate = rospy.Rate(10)
        
        # Create publisher
        #self.clawPosePub = rospy.Publisher('FK_ClawPose', ClawPose, queue_size=1) Not being used?
        
        # Create subscriber
        rospy.Subscriber('Actuator_CurrentJS', CurrentJointState, self.cb_calculate_claw_pose)

        ## Cube pose ##
        # Publish
        self.cubePosePub = rospy.Publisher('FK_CubePose', CubePose, queue_size=10)
        # Subscribe
        rospy.Subscriber('Camera_Pose', CubePose, self.cb_calculate_cube_pose)
        
        rospy.sleep(2)  # give system time to init everything
        
        
    def test(self):
        rospy.logerr("start test")
        data = CubePose()
        data.position = [100, 88, 219.464, 0]
        data.colour = "RED"
        self.cb_calculate_cube_pose(data)

    def initialise_robot_parameters(self):
        """ Model parameters """
        self.theta1_home_offset = (90) * (
                np.pi / 180)  # rad - this is the home angle of the arm relative to the frame {1} x axis
        self.claw_angle_offset = -15 * (np.pi / 180)  # rad - offset angle for claw relative to armB {2}
        self.z1 = 114.  # mm height of the slew joint {1} from origin
        self.armA_l = 185.  # mm length of armA
        self.armB_l = 140.  # mm length of armB
        self.z4 = 10  # mm height of claw
        self.p_6 = np.array([29.104, -29.104, 285.589])  # mm position of camera relative to frame{0}
        self.PITCH = 1.  # For the vertical axis, joint 4
        self.camera_tilt = 63 * np.pi / 180  # tilt angle of the camera {6}

        # Create the initial transformation and screws for all joint frames
        self.T0_1, self.T0_2, self.T1_2, self.T2_3, self.T3_4, self.T6_5, self.T1_6, self.T0_5 \
            = np.zeros((8, 4, 4))

        # Joint angles in radians. This includes a joint that does not exist in the first position
        # thetas[0] is not a real joint. Used to so that index number is same as joint number.
        self.thetas = np.array([None, 0., 0., 0., 0., 0.])

        # Rotational matrices for the camera frame
        self.R1Z = np.array([[0, 0, 1],
                             [-1, 0, 0],
                             [0, -1, 0]])  # z aligns with the x axis
        self.RZY = rot(np.array([0, 1, 0]), 1 * np.pi / 4)  # rotate around the y axis
        self.RY6 = rot(np.array([1, 0, 0]), -1 * self.camera_tilt)  # rotate around the body x axis
        self.R16 = self.R1Z @ self.RZY @ self.RY6

        self.calculate_transformation_matrices()


    def calculate_transformation_matrices(self):
        # Relative transformation matrices
        self.R1 = rot(np.array([0, 0, 1]), self.thetas[1] + self.theta1_home_offset)
        self.T0_1 = mr.RpToTrans(self.R1, np.array([0, 0, self.z1]))  # origin to armA joint

        # Relative transformation matrices
        self.T1_6 = mr.RpToTrans(self.R16, self.p_6 - np.array([0, 0, self.z1]))  # Camera pose relative to frame {1}
        self.T0_6 = self.T0_1 @ self.T1_6
    
    """
    def test_camera_to_origin(self):
        self.thetas = np.array([0., 45 * np.pi / 180, 0., 0., 0.])

        msg = CubePose()

        msg.position = [0, -7.5, 313, 0]
        print(f"Camera cube position = {msg.position}")
        cubePose = self.cb_calculate_cube_pose(msg)
        print(f"Origin cube position = {cubePose.position}")
        print(f"Origin cube position should be [0, 190, 10, ]\n")

        msg.position = [-150, 211, 213, 0]
        print(f"Camera cube position = {msg.position}")
        cubePose = self.cb_calculate_cube_pose(msg)
        print(f"Origin cube position = {cubePose.position}")
        print(f"Origin cube position should be [-50, -150, 0]\n")

        msg.position= [100, 88.2, 219, 0]
        print(f"Camera cube position = {msg.position}")
        cubePose = self.cb_calculate_cube_pose(msg)
        print(f"Origin cube position = {cubePose.position}")
        print(f"Origin cube position should be [100, 62.2, 50]\n")
    """

if __name__ == '__main__':
    ##np.set_printoptions(precision=2, suppress=True)
    ##fk_ibis = FK_Ibis()
    ##fk_ibis.test_camera_to_origin()

    try:
        FK_Ibis()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

