#!/usr/bin/env python3

import numpy as np
import rospy
from enum import Enum
from control_logic_node.msg import DesPosition, TargetJointState
#import Colour

class Colour(Enum):
    RED = 0
    GREEN = 1
    BLUE = 2
    YELLOW = 3

"""
class DesPosition:
    position = [0., 0., 0.]
    orientation_z = 0.
"""

class IK_Ibis:

    def cb_calculate_ik(self, received):
        position = np.array([received.position[0], received.position[1], received.position[2]])
        orientation = np.array([0, 0, received.position[3]])
        targetJS = self.IKin(position, orientation)
        targetJS.append(0.)
        targetJS.append(0.)
        #print(f"js = {self.to_degrees(targetJS)}")

        msg = TargetJointState()
        msg.thetas = targetJS
        self.pub.Publish(msg)

    """
    # Params for the inverse kinematics of the position of the arm
    self.armA_l = 185.   # mm length of armA
    armB_l = 140.   # mm length of armB
    zHome = 100.    # mm home height of claw
    thetas = np.array([0., 0., 0., 0., zHome])          # theta[0] is not a real joint
    thetaHomeOffset = (157.33 + 90) * (np.pi / 180)     # rad - this is the home angle of the arm relative to the x axis
    clawAngleOffset = -15 * (np.pi / 180)               # rad - offset angle for claw relative to armB
    PITCH = 1.
    z4 = 10     # mm height of claw# For the vertical axis, joint 4
    """
    def __init__(self):
        # Params for the inverse kinematics of the position of the arm
        self.armA_l = 185.  # mm length of armA
        self.armB_l = 140.  # mm length of armB
        self.zHome = 100.  # mm home height of claw
        self.thetas = np.array([0., 0., 0., 0., self.zHome])  # theta[0] is not a real joint
        self.thetaHomeOffset = (157.33 + 90) * (
                    np.pi / 180)  # rad - this is the home angle of the arm relative to the x axis
        self.clawAngleOffset = -15 * (np.pi / 180)  # rad - offset angle for claw relative to armB
        self.PITCH = 1.
        self.z4 = 10  # mm height of claw# For the vertical axis, joint 4
        
        # Initialize node
        rospy.init_node('Inverse_Kinematics', anonymous=True)
        # Publish
        self.pub = rospy.Publisher('IK_JS', self.TargetJointState, queue_size=1)
        # Subscribe
        self.sub = rospy.Subscriber('CL_Position', self.DesPosition, self.cb_calculate_ik)
        

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
        theta1_2 = -1 * (np.pi - C)  # rad

        cosB = (c ** 2 + self.armA_l ** 2 - self.armB_l ** 2) / \
               (2 * c * self.armA_l)  # cosine rule
        B = np.arccos(cosB)
        theta1_1 = gamma + B  # rad

        # Keep the claw at it's given height
        theta1_3 = positionArm[2] * self.PITCH

        # Rotate desired orientation to the claw frame
        orientation_arm = (orientation[2] -
                           self.thetaHomeOffset -
                           theta1_1 -
                           theta1_2 -
                           self.clawAngleOffset)

        # Limit theta3 angles to +/- pi/2
        theta1_3 = 0
        if orientation_arm >= 0:
            theta1_3 = np.mod(orientation_arm, np.pi / 2)
        elif orientation_arm < 0:
            theta1_3 = np.mod(orientation_arm, -1 * np.pi / 2)

        return [theta1_1, theta1_2, theta1_3]

    """ Offset theta1 for the slew axis """
    #FIXME: nothing calls this function
    def slew_angle(self, theta_home_offset, theta1):
        new_angle = theta1 - theta_home_offset

        if new_angle > np.pi:
            new_angle = new_angle - 2 * np.pi
        elif new_angle < -np.pi:
            new_angle = new_angle + 2 * np.pi
        return new_angle

    # change angles to degrees
    def to_degrees(self, angles):
        for i, theta in zip(range(np.size(angles)), angles):
            angles[i] = (theta / (np.pi)) * 180

        return angles

    #FIXME: nothing caalls this function
    def cube_home_analytical(self):
        print("Initialise cube angles using analytical method")
        cube_height = self.z4  # mm
        cube_positions = np.array([
            [[-125, -25, cube_height],
             [-125, -75, cube_height],
             [-175, -75, cube_height],
             [-175, -25, cube_height]],
            [[-25, -125, cube_height],
             [-25, -175, cube_height],
             [-75, -175, cube_height],
             [-75, -125, cube_height]],
            [[75, -125, cube_height],
             [75, -175, cube_height],
             [25, -175, cube_height],
             [25, -125, cube_height]],
            [[175, -25, cube_height],
             [175, -75, cube_height],
             [125, -75, cube_height],
             [125, -25, cube_height]],
        ])

        colour = 0
        colours = 4
        positions = 4
        cube_home_angles = np.array(np.zeros((colours, positions, 4)))
        for colour in range(colours):
            print(f"Colour {colour}")

            for position in range(positions):
                theta1, theta2, theta3 = self.IKin(cube_positions[colour][position], 0)  # zero angle
                thetas_end = np.array([theta1, theta2, theta3, 0])
                cube_home_angles[colour][position] = thetas_end
                print(f"position = {cube_positions[colour][position]}")
                print(f"\tarm angles = {self.to_degrees(thetas_end)}")
                position = position + 1

            print(" ---- ")

        return cube_home_angles

    def test_ik(self):
        desPosition = DesPosition()
        cube_height = self.z4  # mm
        cube_positions = [
            [-125, -25, cube_height],
             [-125, -75, cube_height],
             [-175, -75, cube_height],
             [-175, -25, cube_height],
            [-25, -125, cube_height],
             [-25, -175, cube_height],
             [-75, -175, cube_height],
             [-75, -125, cube_height],
            [75, -125, cube_height],
             [75, -175, cube_height],
             [25, -175, cube_height],
             [25, -125, cube_height],
            [175, -25, cube_height],
             [175, -75, cube_height],
             [125, -75, cube_height],
             [125, -25, cube_height]]

        for position in cube_positions:
            desPosition.position = position
            desPosition.position.append(0.)
            self.cb_calculate_ik(desPosition)

if __name__ == '__main__':
    #ibis = IK_Ibis()
    #ibis.test_ik()

    try:
        IK_Ibis()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

