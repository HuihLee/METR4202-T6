#!/usr/bin/env python3

import numpy as np
import modern_robotics as mr
from enum import Enum


class Colour(Enum):
    RED = 0
    GREEN = 1
    BLUE = 2
    YELLOW = 3


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


# Create a 4x4 transformation matrix
def create_t(rotation=np.eye(3),
             translation=np.array([0, 0, 0])):
    T = np.concatenate((rotation, translation.T), axis=1)
    T = np.concatenate((T, np.array([[0, 0, 0, 1]])), axis=0)
    return T


# limit angles to between -pi < theta pi
def limitAngles(angles):
    for i, theta in zip(range(np.size(angles)), angles):
        newAngle = 0
        # The following logic is used to correct for pythons modulo
        # operator only returning a number of the same sign as the divisor AND
        # to ensure that the angles don't exceed 180 degs in either direction
        if (theta > 0):
            newAngle = np.mod(theta, 2 * np.pi)

            if newAngle > np.pi:
                newAngle = newAngle - 2 * np.pi

        elif (theta < 0):
            newAngle = np.mod(theta, -2 * np.pi)

            if newAngle < -np.pi:
                newAngle = newAngle + 2 * np.pi

        angles[i] = newAngle
    return angles


# Theta 2 can only go between 0 and -pi radians
def allowableAngles(angles):
    if angles[1] > 0 or angles[1] <= -np.pi:
        print("you're fucked")
    print(angles[1])


# change angles to degrees
def toDegrees(angles):
    for i, theta in zip(range(np.size(angles)), angles):
        angles[i] = (theta / (np.pi)) * 180

    return angles


def testKinematics(M, Screws, thetas):
    """ Below are examples of forward kinematics for the robot arm."""
    # Calculate an example forward kinematics
    T_calc = mr.FKinSpace(M, Screws.T, thetas[1:])
    print("Test forward kinematics")
    print("Move no joints")
    print(f"thetas = \n{thetas}")
    print(f"T_calc = \n{T_calc}\n")

    # Rotate the orientation joint
    thetas[3] = np.pi / 2
    T_calc = mr.FKinSpace(M, Screws.T, thetas[1:])
    print(f"Rotate claw orientation joint by {thetas[3]}")
    print(f"thetas = \n{thetas}")
    print(f"T_calc = \n{T_calc}\n")

    # Rotate arm B and correct for orientation with joint 3
    thetas[2] = -np.pi / 2
    thetas[3] = np.pi / 2
    T_calc = mr.FKinSpace(M, Screws.T, thetas[1:])
    print(f"Rotate armB joint by {thetas[2]} and correct orientation of claw by {thetas[3]}")
    print(f"thetas = \n{thetas}")
    print(f"T_calc = \n{T_calc}\n")

    # Rotate arm A and correct for orientation with joint 3
    thetas[1] = np.pi / 2
    thetas[2] = 0
    thetas[3] = -np.pi / 2
    T_calc = mr.FKinSpace(M, Screws.T, thetas[1:])
    print(f"Rotate armA joint (slew) by {thetas[1]} and correct orientation of claw by {thetas[3]}")
    print(f"thetas = \n{thetas}")
    print(f"T_calc = \n{T_calc}\n")

    # Move vertical position of claw
    thetas = np.array([0., 0., 0., 0., 80])
    T_calc = mr.FKinSpace(M, Screws.T, thetas[1:])
    print(f"Move the vertical position of claw up")
    print(f"thetas = \n{thetas}")
    print(f"T_calc = \n{T_calc}\n")


def testInverseKinematics(M, Screws):
    print("\nTest Inverse Kinematics using NR")
    angleGuess = 0.1

    # Inverse Kinematics for home config
    orientation = rot(np.array([0, 0, 1]), thetaHomeOffset)
    translation = np.array([[-125.26, -299.89, z4]])

    # Desired configuration
    T_des = np.concatenate((np.concatenate((orientation, translation.T), axis=1),
                            np.array([[0, 0, 0, 1]])))

    # Make an initial guess and specify the acceptable error

    thetasInit = np.array([angleGuess, angleGuess, angleGuess, angleGuess])

    thetasEnd, success = mr.IKinSpace(Screws.T, M, T_des, thetasInit, errorOmega, errorPosition)
    T_calc = mr.FKinSpace(M, Screws.T, thetasEnd)

    print(f"Calculate angles for home configuration")
    print(f"T_des = \n{T_des}")
    print(f"T_calc = \n{T_calc}")
    print(f"Did it work? {success}")
    print(f"arm angles = {thetasEnd}\n")

    # Inverse Kinematics for moving vertical axis only
    orientation = rot(np.array([0, 0, 1]), thetaHomeOffset)
    translation = np.array([[-125.26, -299.89, 106.14]])

    # Desired configuration
    T_des = np.concatenate((np.concatenate((orientation, translation.T), axis=1),
                            np.array([[0, 0, 0, 1]])))

    # Make an initial guess and specify the acceptable error
    thetasInit = np.array([angleGuess, angleGuess, angleGuess, angleGuess])

    thetasEnd, success = mr.IKinSpace(Screws.T, M, T_des, thetasInit, errorOmega, errorPosition)
    T_calc = mr.FKinSpace(M, Screws.T, thetasEnd)

    print(f"Calculate angles for moving vertical axis only")
    print(f"T_des = \n{T_des}")
    print(f"T_calc = \n{T_calc}")
    print(f"Did it work? {success}")
    print(f"arm angles = {thetasEnd}\n")

    # Inverse Kinematics for moving vertical axis down
    orientation = rot(np.array([0, 0, 1]), thetaHomeOffset)
    translation = np.array([[-125.26, -299.89, 0]])

    # Desired configuration
    T_des = np.concatenate((np.concatenate((orientation, translation.T), axis=1),
                            np.array([[0, 0, 0, 1]])))

    # Make an initial guess and specify the acceptable error
    thetasInit = np.array([angleGuess, angleGuess, angleGuess, angleGuess])

    thetasEnd, success = mr.IKinSpace(Screws.T, M, T_des, thetasInit, errorOmega, errorPosition)
    T_calc = mr.FKinSpace(M, Screws.T, thetasEnd)

    print(f"Calculate angles for moving vertical axis down to zero")
    print(f"T_des = \n{T_des}")
    print(f"T_calc = \n{T_calc}")
    print(f"Did it work? {success}")
    print(f"arm angles = {thetasEnd}\n")

    # Inverse Kinematics for claw orientation only
    orientation = rot(np.array([0, 0, 1]), 0)
    translation = np.array([[-125.26, -299.89, z4]])

    # Desired configuration
    T_des = np.concatenate((np.concatenate((orientation, translation.T), axis=1),
                            np.array([[0, 0, 0, 1]])))

    # Make an initial guess and specify the acceptable error
    thetasInit = np.array([angleGuess, 1.5, angleGuess, -1.5])

    thetasEnd, success = mr.IKinSpace(Screws.T, M, T_des, thetasInit, errorOmega, errorPosition)
    T_calc = mr.FKinSpace(M, Screws.T, thetasEnd)

    print(f"Calculate angles for moving claw orientation only")
    print(f"T_des = \n{T_des}")
    print(f"T_calc = \n{T_calc}")
    print(f"Did it work? {success}")
    print(f"arm angles = {thetasEnd}\n")

    # Inverse Kinematics for rotating joint 2 and compensating orientation only
    orientation = rot(np.array([0, 0, 1]), thetaHomeOffset)
    translation = np.array([[-200.49, -116.75, z4]])

    # Desired configuration
    T_des = np.concatenate((np.concatenate((orientation, translation.T), axis=1),
                            np.array([[0, 0, 0, 1]])))

    # Make an initial guess and specify the acceptable error
    thetasInit = np.array([angleGuess, -1.5, 1.5, angleGuess])

    thetasEnd, success = mr.IKinSpace(Screws.T, M, T_des, thetasInit, errorOmega, errorPosition)
    T_calc = mr.FKinSpace(M, Screws.T, thetasEnd)

    print(f"Calculate angles for moving joint 2 only and correcting orientation")
    print(f"T_des = \n{T_des}")
    print(f"T_calc = \n{T_calc}")
    print(f"Did it work? {success}")
    print(f"arm angles = {thetasEnd}\n")

    # Inverse Kinematics for rotating joint 1 and compensating orientation only
    orientation = rot(np.array([0, 0, 1]), thetaHomeOffset)
    translation = np.array([[299.89, -125.26, z4]])

    # Desired configuration
    T_des = np.concatenate((np.concatenate((orientation, translation.T), axis=1),
                            np.array([[0, 0, 0, 1]])))

    # Make an initial guess and specify the acceptable error
    thetasInit = np.array([1.5, angleGuess, -1.5, angleGuess])

    thetasEnd, success = mr.IKinSpace(Screws.T, M, T_des, thetasInit, errorOmega, errorPosition)
    T_calc = mr.FKinSpace(M, Screws.T, thetasEnd)

    print(f"Calculate angles for moving joint 1 only and correcting orientation")
    print(f"T_des = \n{T_des}")
    print(f"T_calc = \n{T_calc}")
    print(f"Did it work? {success}")
    print(f"arm angles = {thetasEnd}\n")

    # Inverse Kinematics for position 1 cube 1
    orientation = rot(np.array([0, 0, 1]), thetaHomeOffset)
    translation = np.array([[-125, -25, z4]])

    # Desired configuration
    T_des = np.concatenate((np.concatenate((orientation, translation.T), axis=1),
                            np.array([[0, 0, 0, 1]])))

    # Make an initial guess and specify the acceptable error
    thetasInit = np.array([0.1, -120 * (np.pi / 180), angleGuess, angleGuess])

    thetasEnd, success = mr.IKinSpace(Screws.T, M, T_des, thetasInit, errorOmega, errorPosition)
    T_calc = mr.FKinSpace(M, Screws.T, thetasEnd)

    print(f"Calculate angles for moving to cube home position 1,1")
    print(f"T_des = \n{T_des}")
    print(f"T_calc = \n{T_calc}")
    print(f"Did it work? {success}")
    print(f"arm angles = {toDegrees(thetasEnd)}\n")


def compareCubeHome(M, Screws, cubeHomeAngles):
    """ Cube home angles have been manually calculated using CAD"""
    # RED position
    cubeHomeAngles[Colour.RED.value][0] = np.array([-6.91 * np.pi / 180,
                                                    -(180 - 43.5) * np.pi / 180,
                                                    0, 0])
    cubeHomeAngles[Colour.RED.value][1] = np.array([11.94 * np.pi / 180,
                                                    -(180 - 51.03) * np.pi / 180,
                                                    0, 0])
    cubeHomeAngles[Colour.RED.value][2] = np.array([-0.37 * np.pi / 180,
                                                    -(180 - 70.17) * np.pi / 180,
                                                    0, 0])
    cubeHomeAngles[Colour.RED.value][3] = np.array([-13.37 * np.pi / 180,
                                                    -(180 - 64.16) * np.pi / 180,
                                                    0, 0])
    # GREEN positions
    cubeHomeAngles[Colour.GREEN.value][0] = np.array([-60.47 * np.pi / 180,
                                                      -136.5 * np.pi / 180,
                                                      0, 0])
    cubeHomeAngles[Colour.GREEN.value][1] = np.array([-60 * np.pi / 180,
                                                      -116.3 * np.pi / 180,
                                                      0, 0])
    cubeHomeAngles[Colour.GREEN.value][2] = np.array([-43.23 * np.pi / 180,
                                                      -109.83 * np.pi / 180,
                                                      0, 0])
    cubeHomeAngles[Colour.GREEN.value][3] = np.array([-40.01 * np.pi / 180,
                                                      -128.97 * np.pi / 180,
                                                      0, 0])
    # BLUE positions
    cubeHomeAngles[Colour.BLUE.value][0] = np.array([-101.94 * np.pi / 180,
                                                     -128.97 * np.pi / 180,
                                                     0, 0])
    cubeHomeAngles[Colour.BLUE.value][1] = np.array([-89.63 * np.pi / 180,
                                                     -109.83 * np.pi / 180,
                                                     0, 0])
    cubeHomeAngles[Colour.BLUE.value][2] = np.array([-76.26 * np.pi / 180,
                                                     -115.84 * np.pi / 180,
                                                     0, 0])
    cubeHomeAngles[Colour.BLUE.value][3] = np.array([-83.09 * np.pi / 180,
                                                     -136.5 * np.pi / 180,
                                                     0, 0])
    # YELLOW positions
    cubeHomeAngles[Colour.YELLOW.value][0] = np.array([-150 * np.pi / 180,
                                                       -115.84 * np.pi / 180,
                                                       0, 0])
    cubeHomeAngles[Colour.YELLOW.value][1] = np.array([-133.23 * np.pi / 180,
                                                       -109.83 * np.pi / 180,
                                                       0, 0])
    cubeHomeAngles[Colour.YELLOW.value][2] = np.array([-130.01 * np.pi / 180,
                                                       -128.97 * np.pi / 180,
                                                       0, 0])
    cubeHomeAngles[Colour.YELLOW.value][3] = np.array([-150.47 * np.pi / 180,
                                                       -136.5 * np.pi / 180,
                                                       0, 0])

    colours = [Colour.RED, Colour.GREEN, Colour.BLUE, Colour.YELLOW]

    for colour in colours:
        print("{}".format(colour))
        for angle in cubeHomeAngles[colour.value]:
            T_des = mr.FKinSpace(M, Screws.T, angle)
            print(f"T_des = \n{T_des}")
            a, success = (mr.IKinSpace(Screws.T, M, T_des, angle, errorOmega, errorPosition))
            print(f"T_found = \n{mr.FKinSpace(M, Screws.T, a)}")
            print("\tManually found position \t{}".format(toDegrees(angle)))
            print("\tNR method position ({}) \t{}".format(success, toDegrees(a)))
    print("")


def initialiseCubeAngles(cubeHomeAngles):
    cubeHeight = z4  # mm
    cubePositions = np.array([
        [[-125, -25, cubeHeight],
         [-125, -75, cubeHeight],
         [-175, -75, cubeHeight],
         [-175, -25, cubeHeight]],
        [[-25, -125, cubeHeight],
         [-25, -175, cubeHeight],
         [-75, -175, cubeHeight],
         [-75, -125, cubeHeight]],
        [[75, -125, cubeHeight],
         [75, -175, cubeHeight],
         [25, -175, cubeHeight],
         [25, -125, cubeHeight]],
        [[175, -25, cubeHeight],
         [175, -75, cubeHeight],
         [125, -75, cubeHeight],
         [125, -25, cubeHeight]],
    ])
    print("\nInitialise cube angles using NR method")

    # Inverse Kinematics for a point and orientation
    orientation = rot(np.array([0, 0, 0]), 0)
    colour = 0
    colours = [Colour.RED, Colour.GREEN, Colour.BLUE, Colour.YELLOW]
    for colour in colours:
        position = 0
        positions = 4
        print(colours[colour.value])

        while position < positions:
            translation = np.array([[cubePositions[colour.value][position][0],
                                     cubePositions[colour.value][position][1],
                                     cubePositions[colour.value][position][2]]])

            # Desired configuration
            T_des = np.concatenate((np.concatenate((orientation, translation.T), axis=1),
                                    np.array([[0, 0, 0, 1]])))

            # Make an initial guess and specify the acceptable error
            thetasInit = np.array([0., 0., 0., 0.])

            if colour == Colour.RED:
                thetasInit = np.array([-0.1 * np.pi / 180, -120 * np.pi / 180, 0., 0.])
            elif colour == Colour.GREEN:
                thetasInit = np.array([50 * np.pi / 180, -120 * np.pi / 180, 0., 0.])
            elif colour == Colour.BLUE:
                thetasInit = np.array([80 * np.pi / 180, -120 * np.pi / 180, 0., 0.])
            elif colour == Colour.YELLOW:
                thetasInit = np.array([140 * np.pi / 180, -120 * np.pi / 180, 0., 0.])

            thetasEnd, success = mr.IKinSpace(Screws.T, M, T_des, thetasInit, errorOmega, errorPosition)
            T_calc = mr.FKinSpace(M, Screws.T, thetasEnd)

            cubeHomeAngles[colour.value][position] = thetasEnd
            position = position + 1

            # print("Starting Point M = {}".format(M))
            print(f"Initial Guess {toDegrees(thetasInit)}")
            print(f"T_des = \n{T_des}")
            print(f"Did it work? {success}")
            print(f"arm angles = {toDegrees(thetasEnd)}\n")
            print(f"T_calc = \n{T_calc}")

        print(" ---- ")

    return cubeHomeAngles


def cubeHomeAnalytical(cubeHomeAngles):
    print("Initialise cube angles using analytical method")
    cubeHeight = z4  # mm
    cubePositions = np.array([
        [[-125, -25, cubeHeight],
         [-125, -75, cubeHeight],
         [-175, -75, cubeHeight],
         [-175, -25, cubeHeight]],
        [[-25, -125, cubeHeight],
         [-25, -175, cubeHeight],
         [-75, -175, cubeHeight],
         [-75, -125, cubeHeight]],
        [[75, -125, cubeHeight],
         [75, -175, cubeHeight],
         [25, -175, cubeHeight],
         [25, -125, cubeHeight]],
        [[175, -25, cubeHeight],
         [175, -75, cubeHeight],
         [125, -75, cubeHeight],
         [125, -25, cubeHeight]],
    ])

    colour = 0
    colours = [Colour.RED, Colour.GREEN, Colour.BLUE, Colour.YELLOW]
    for colour in colours:
        position = 0
        positions = 4
        print(colours[colour.value])

        while position < positions:
            theta1, theta2 = IKinAnalytical(cubePositions[colour.value][position][0:2], armA_l, armB_l)
            thetasEnd = np.array([slewAngle(thetaHomeOffset, theta1), theta2, 0, 0])
            cubeHomeAngles[colour.value][position] = thetasEnd
            print(f"position = {cubePositions[colour.value][position][0:2]}")
            print(f"\tarm angles = {toDegrees(thetasEnd)}")
            position = position + 1

        print(" ---- ")

    return cubeHomeAngles


def cubeHomeTest(cubeHomeAngles):
    colours = [Colour.RED, Colour.GREEN, Colour.BLUE, Colour.YELLOW]

    for colour in colours:
        print("{}".format(colour))
        for angle in cubeHomeAngles[colour.value]:
            T_des = mr.FKinSpace(M, Screws.T, angle)
            print("\tAnalytically found angles \t{}".format(toDegrees(angle)))
            # print(f"T_des =\n {T_des}")
    print("")


""" Using given x, y coordinates, the inverse kinematics are calculated analytically"""


# todo : implement solution when x or y = 0
def IKinAnalytical(xy, armA, armB):
    c = np.sqrt(xy[0] ** 2 + xy[1] ** 2)  # pythagoras theorem
    gamma = np.arctan2(xy[1], xy[0])

    cosC = (armA ** 2 + armB ** 2 - c ** 2) / (2 * armA * armB)  # cosine rule
    C = np.arccos(cosC)
    theta2 = -1 * (np.pi - C)  # rad

    cosB = (c ** 2 + armA ** 2 - armB ** 2) / (2 * c * armA)  # cosine rule
    B = np.arccos(cosB)
    theta1 = gamma + B  # rad

    return (theta1, theta2)


""" Offset theta1 for the slew axis """


def slewAngle(thetaHomeOffset, theta1):
    newAngle = theta1 - thetaHomeOffset

    if newAngle > np.pi:
        newAngle = newAngle - 2 * np.pi
    elif newAngle < -np.pi:
        newAngle = newAngle + 2 * np.pi
    return newAngle


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

if __name__ == '__main__':
    np.set_printoptions(precision=2, suppress=True)
    """ Model parameters """
    thetaHomeOffset = (157.33 + 90) * (np.pi / 180)  # rad - this is the home angle of the arm relative to the x axis
    clawAngleOffset = -15 * (np.pi / 180)  # rad - offset angle for claw relative to armB
    z1 = 114.  # mm height of the slew joint from origin
    armA_l = 185.  # mm length of armA
    armB_l = 140.  # mm length of armB
    z4 = 10  # mm height of claw
    r_6 = np.array([29.104, 29.104, 285.589])  # mm position of camera relative to frame{0}
    PITCH = 1.  # For the vertical axis, joint 4

    """ Create the initial transformation and screws for all joint frames """
    T0_1, T0_2, T1_2, T2_3, T3_4, T6_5, T1_6 = np.zeros((7, 4, 4))

    # Joint angles in radians. This includes a joint that does not exist in the first position
    thetas = np.array(
        [0., 0., 0., 0., 0.])  # thetas[0] is not a real joint. Used to so that index number is same as joint number.

    # Relative transformation matrices
    R1 = rot(np.array([0, 0, 1]), thetas[1] + thetaHomeOffset)
    T0_1 = mr.RpToTrans(R1, np.array([0, 0, z1]))  # origin to armA joint
    R2 = rot(np.array([0, 0, 1]), thetas[2])
    T1_2 = mr.RpToTrans(R2, np.array([armA_l, 0, 0]))  # armA joint to armB joint
    R3 = rot(np.array([0, 0, 1]), thetas[3] + clawAngleOffset)
    T2_3 = mr.RpToTrans(R3, np.array([armB_l, 0, 0]))  # armB joint to claw orientation
    R4 = rot(np.array([0, 0, 1]), 0)
    T3_4 = mr.RpToTrans(R4, np.array([0, 0, (z4 - z1) + PITCH * thetas[4]]))
    R1C = np.array([[0, 0, 1],
                    [1, 0, 0],
                    [0, 1, 0]])  # z aligns with the x axis
    RC6 = rot(np.array([0, 1, 0]), -1 * np.pi / 4)  # rotate around the y axis
    R06 = np.matmul(R1C, RC6)
    T1_6 = mr.RpToTrans(R06, r_6 - np.array([0, 0, z1]))  # Camera pose relative to frame {1}

    T0_6 = T0_1 @ T1_6

    # print(f"T0_6 = \n{T0_6}")

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
    # print(Screws)

    # Allowable errors for newton raphson
    errorOmega = 0.01
    errorPosition = 0.01

    # Test Kinematics
    # testKinematics(M, Screws, thetas)

    # Space Jacobian just as an example
    Js = mr.JacobianSpace(Screws.T, thetas[1:])

    # Test Inverse Kinematics
    # testInverseKinematics(M, Screws)

    """ Cube home positions have been calculated in CAD.
    Compare the calculated angles with the forward kinematics """
    # compareCubeHome(M, Screws, np.array(np.zeros((4, 4, 4))))

    """ Get angle values for the cube locations """
    # cubeHomeAngles = np.array(np.szeros((4, 4, 4)))
    # cubeHomeAngles = initialiseCubeAngles(cubeHomeAngles)

    """ Get angle values for the cube locations using analytical method"""
    # cubeHomeAngles = np.array(np.zeros((4, 4, 4)))
    # cubeHomeAngles = cubeHomeAnalytical(cubeHomeAngles)
    # cubeHomeTest(cubeHomeAngles)
