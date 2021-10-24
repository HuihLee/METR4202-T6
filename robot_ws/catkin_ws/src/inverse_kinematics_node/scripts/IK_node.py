#!/usr/bin/env python3

import numpy as np
import rospy
from enum import Enum
from control_logic_node.msg import DesPosition, TargetJointState

import modern_robotics as mr

class Colour(Enum):
    RED = 0
    GREEN = 1
    BLUE = 2
    YELLOW = 3


class IK_Ibis:

    def cb_calculate_ik(self, received):
        rospy.logerr(received)
        position = np.array([received.position[0], received.position[1], received.position[2]])
        orientation = np.array([0, 0, received.orientation_z])
        targetJS = self.IKin(position, orientation)
        targetJS.append(0.) ## ignore vertical postion
        targetJS.append(0.) ## ignore claw open state

        msg = TargetJointState()
        msg.thetas = targetJS

        self.pub.publish(msg)


    def __init__(self):
        # Params for the inverse kinematics of the position of the arm
        self.armA_l = 185.  # mm length of armA
        self.armB_l = 140.  # mm length of armB
        self.zHome = 100.  # mm home height of claw
        self.thetas = np.array([0., 0., 0., 0., self.zHome])  # theta[0] is not a real joint
        self.thetaHomeOffset = (56) * ( #157.33
                    np.pi / 180)  # rad - this is the home angle of the arm relative to the x axis
        self.clawAngleOffset = -15 * (np.pi / 180)  # rad - offset angle for claw relative to armB
        self.PITCH = 1.
        self.z4 = 10  # mm height of claw# For the vertical axis, joint 4
        
        # Initialize node
        rospy.init_node('Inverse_Kinematics', anonymous=True, log_level=rospy.DEBUG)
        
        # Publish
        self.pub = rospy.Publisher('IK_JS', TargetJointState, queue_size=10)
        # Subscribe
        rospy.Subscriber('CL_Position', DesPosition, self.cb_calculate_ik)
        
        rate = rospy.Rate(10)
        #self.test_ik()
        

    def IKin(self, position, orientation):
        # Rotate position to the offset frame for the slew joint
        rotate0_1 = np.array([[np.cos(self.thetaHomeOffset), np.sin(self.thetaHomeOffset), 0],
                              [-1 * np.sin(self.thetaHomeOffset), np.cos(self.thetaHomeOffset), 0],
                              [0, 0, 1]])
        positionArm = np.dot(rotate0_1, position)

        # Calculate the arm positions
        c = np.sqrt(positionArm[0] ** 2 + positionArm[1] ** 2)  # pythagoras theorem
        gamma = np.arctan2(positionArm[1], positionArm[0])

        cosC = (self.armA_l ** 2 + self.armB_l ** 2 - c ** 2) / \
               (2 * self.armA_l * self.armB_l)  # cosine rule
        C = np.arccos(cosC)
        theta1_2 = 1 * (np.pi - C)  + self.clawAngleOffset # rad

        cosB = (c ** 2 + self.armA_l ** 2 - self.armB_l ** 2) / \
               (2 * c * self.armA_l)  # cosine rule
        B = np.arccos(cosB)
        theta1_1 = gamma + B  # rad

                          
        R0_1 = self.rot(np.array([0, 0, 1]), theta1_1 + self.thetaHomeOffset+45*np.pi/180)
        R1_2 = self.rot(np.array([0, 0, 1]), -theta1_2)
        R2_3_A = self.rot(np.array([0, 0, 1]), self.clawAngleOffset)
        R2_3_B = self.rot(np.array([0, 1, 0]), np.pi)


    
        R0_C = self.rot(np.array([0, 0, 1]), orientation)
        R1_C = mr.RotInv(R0_1) @ R0_C
        R2_C = mr.RotInv(R1_2) @ R1_C
        R3_C = mr.RotInv(R2_3_B) @ mr.RotInv(R2_3_A) @ R2_C
        orientation_arm = np.arctan2(R3_C[1][0], R3_C[0][0])
        

        # Limit theta3 angles to +/- pi/2
        theta1_3 = 0
        if orientation_arm >= 0:
            theta1_3 = np.mod(orientation_arm, np.pi / 2)
        elif orientation_arm < 0:
            theta1_3 = np.mod(orientation_arm, -1 * np.pi / 2)

        return [theta1_1, theta1_2, theta1_3]
    
    def rot(self, axis, angle, vect=None, matrix=None):
        I = np.eye(3)
        skew = mr.VecToso3(axis)
        rotated = I + np.sin(angle) * skew + (1 - np.cos(angle)) * np.matmul(skew, skew)
        if vect != None:
            rotated = rotated * vect
        elif matrix != None:
            rotated = rotated * matrix
        return rotated
    

    # change angles to degrees
    def to_degrees(self, angles):
        for i, theta in zip(range(np.size(angles)), angles):
            angles[i] = (theta / (np.pi)) * 180

        return angles

   


if __name__ == '__main__':

    try:
        IK_Ibis()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

