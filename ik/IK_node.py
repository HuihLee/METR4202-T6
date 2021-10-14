import numpy as np
import rospy
import modern_robotics as mr
from enum import Enum
from geometry_msgs.msg import Pose
from sensor_msgs.msg import JointState

class IK_Ibis:
    # Params for the inverse kinematics of the position of the arm
    armA_l = 185.  # mm length of armA
    armB_l = 140.  # mm length of armB
    zHome = 100. # mm home height of claw
    thetas = np.array([0., 0., 0., 0., zHome]) # theta[0] is not a real joint
    thetaHomeOffset = (157.33 + 90) * (np.pi / 180);  # rad - this is the home angle of the arm relative to the x axis
    clawAngleOffset = -15 * (np.pi / 180)  # rad - offset angle for claw relative to armB
    PITCH = 1.  # For the vertical axis, joint 4

    def __init__(self):
        position = [0] * 3 # xyz (m)
        orientation = 0 # rotation about z axis (rad)
        msg = TargetJointState()

        # Initialize node
        rospy.init_node('Inverse_Kinematics', anonymous=True)
        # Publish
        self.pub = rospy.Publisher('IK_JS', TargetJointState, queue_size=1)
        # Subscribe
        self.sub = rospy.Subscriber('CL_Position', DesPosition, self.cb_calculate_ik)

    def cb_calculate_ik(self, received):
        self.position = np.array([received.position[0], received.position[1], received.position[2]])
        self.orientation = np.array([0, 0, received.position[3]])
        targetJS = self.IKin(self.position, self.orientation)


        self.msg.thetas = targetJS.toList()
        self.pub.Publish(self.msg)

    def IKin(self, position, orientation):
        # TODO: test this function
        # TODO: should this position transformation happen elsewhere?

        # Rotate position to the offset frame for the arm
        rotate0_1 = np.array([[np.cos(self.thetaHomeOffset), np.sin(self.thetaHomeOffset), 0],
                              [-1 * np.sin(self.thetaHomeOffset), np.cos(self.thetaHomeOffset), 0],
                              0, 0, 1])
        positionArm = np.dot(rotate0_1, position)

        # Calculate the arm positions
        c = np.sqrt(positionArm[0] ** 2 + positionArm[1] ** 2)  # pythagoras theorem
        gamma = np.arctan2(positionArm[1], positionArm[0])

        cosC = (self.armA_l ** 2 + self.armB_l ** 2 - c ** 2) / \
               (2 * self.armA_l * self.armB_l)  # cosine rule
        C = np.arccos(cosC)
        theta1_2 = -1 * (np.pi - C)  # rad

        cosB = (c ** 2 + self.armA_l ** 2 - self.armB_l ** 2) / \
               (2 * c * self.armA_l)  # cosine rule
        B = np.arccos(cosB)
        theta1_1 = gamma + B  # rad

        # Keep the claw at it's given height
        theta1_3 = positionArm[2] * PITCH

        # Rotate desired orientation to the claw frame
        orientationArm = np.array([0, 0,
                                   orientationDes[2]
                                   - self.thetaHomeOffset
                                   - self.theta1_1
                                   - self.theta1_2
                                   - self.clawAngleOffset])

        # Limit theta4 angles to +/- pi/2
        theta4_calc = 0
        if (orientationArm[2] > 0):
            theta4_calc = np.mod(orientationArm[2], np.pi / 2)
        elif (orientationArm[2] < 0):
            theta4_calc = np.mod(orientationArm[2], -1 * np.pi / 2)

        return (theta1_1, theta1_2, theta1_3)


