import numpy as np
import modern_robotics as mr
from enum import Enum

class Colour(Enum):
    RED = 0
    GREEN = 1
    BLUE = 2
    PURPLE = 3

""" Helper functions"""
# Create a 3x3 rotation matrix
def rot(axis, angle, vect = None, matrix = None):
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

def testKinematics(M, Screws, thetas,):
    """ Below are examples of forward kinematics for the robot arm."""
    # Calculate an example forward kinematics
    T_calc = mr.FKinSpace(M, Screws.T, thetas[1:])
    print("thetas = {}".format(thetas))
    print("T_calc = {}".format(T_calc))

    # Rotate the orientation joint
    thetas[3] =  np.pi/2
    T_calc = mr.FKinSpace(M, Screws.T, thetas[1:])
    print("thetas = {}".format(thetas))
    print("T_calc = {}".format(T_calc))

    # Rotate arm B and correct for orientation with joint 3
    thetas[3] = np.pi/2
    thetas[2] =  -1 * np.pi/2
    T_calc = mr.FKinSpace(M, Screws.T, thetas[1:])
    print("thetas = {}".format(thetas))
    print("T_calc = {}".format(T_calc))

    # Rotate arm A and correct for orientation with joint 3
    thetas[3] = -np.pi/2
    thetas[2] =  -1 * np.pi/2
    thetas[1] = np.pi
    T_calc = mr.FKinSpace(M, Screws.T, thetas[1:])
    print("thetas = {}".format(thetas))
    print("T_calc = {}".format(T_calc))

    # Rotate arm A and correct for orientation with joint 3
    thetas = np.array([0., 0., 0., 0., 0.])
    thetas[4] = -114
    T_calc = mr.FKinSpace(M, Screws.T, thetas[1:])
    print("thetas = {}".format(thetas))
    print("T_calc = {}".format(T_calc))

def testInverseKinematics(M, Screws):

    # Inverse Kinematics for a point and orientation
    orientation = rot(np.array([0, 0, 1]), 0)
    translation = np.array([[0, 325, 114]])

    # Calculate the inverse kinematics
    # Desired configuration
    T_des = np.concatenate((np.concatenate((orientation, translation.T), axis=1),
                            np.array([[0, 0, 0, 1]])))

    # Make an initial guess and specify the acceptable error
    angleGuess = -np.pi / 2
    thetasInit = np.array([angleGuess, angleGuess, angleGuess, angleGuess])
    errorOmega = 0.001
    errorPosition = 0.001

    thetasEnd, success = mr.IKinSpace(Screws.T, M, T_des, thetasInit, errorOmega, errorPosition)
    thetasEnd = limitAngles(thetasEnd)
    T_calc = mr.FKinSpace(M, Screws.T, thetasEnd)

    print("Starting Point M = {}".format(M))
    print("T_des = {}".format(T_des))
    print("T_calc = {}".format(T_calc))
    print("Did it work? {}".format(success))
    print("arm angles = {}".format(toDegrees(thetasEnd)))

    # Inverse Kinematics for a point and orientation
    orientation = rot(np.array([0, 0, 1]), np.pi/2)
    translation = np.array([[0, 325, 114]])

    # Desired configuration
    T_des = np.concatenate((np.concatenate((orientation, translation.T), axis=1),
                            np.array([[0, 0, 0, 1]])))

    # Make an initial guess and specify the acceptable error
    angleGuess = -np.pi / 2
    thetasInit = np.array([angleGuess, angleGuess, angleGuess, angleGuess])
    errorOmega = 0.001
    errorPosition = 0.001

    thetasEnd, success = mr.IKinSpace(Screws.T, M, T_des, thetasInit, errorOmega, errorPosition)
    thetasEnd = limitAngles(thetasEnd)
    T_calc = mr.FKinSpace(M, Screws.T, thetasEnd)
    #allowableAngles(thetasEnd)

    print("Starting Point M = {}".format(M))
    print("T_des = {}".format(T_des))
    print("T_calc = {}".format(T_calc))
    print("Did it work? {}".format(success))
    print("arm angles = {}".format(toDegrees(thetasEnd)))

    # Inverse Kinematics for a point and orientation
    orientation = rot(np.array([0, 0, 1]), 0)
    translation = np.array([[-140, -185, 0]])

    # Desired configuration
    T_des = np.concatenate((np.concatenate((orientation, translation.T), axis=1),
                            np.array([[0, 0, 0, 1]])))

    # Make an initial guess and specify the acceptable error
    angleGuess = -np.pi / 2
    thetasInit = np.array([angleGuess, angleGuess, angleGuess, angleGuess])
    errorOmega = 0.001
    errorPosition = 0.001

    thetasEnd, success = mr.IKinSpace(Screws.T, M, T_des, thetasInit, errorOmega, errorPosition)
    thetasEnd = limitAngles(thetasEnd)
    T_calc = mr.FKinSpace(M, Screws.T, thetasEnd)
    # allowableAngles(thetasEnd)

    print("Starting Point M = {}".format(M))
    print("T_des = {}".format(T_des))
    print("T_calc = {}".format(T_calc))
    print("Did it work? {}".format(success))
    print("arm angles = {}".format(toDegrees(thetasEnd)))

def initialiseCubeAngles(cubeHomeAngles):
    cubeHeight = 16 # mm
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

    # Inverse Kinematics for a point and orientation
    orientation = rot(np.array([0, 0, 1]), 0)
    colour = 0
    colours = 4
    while colour < colours:
        position = 0
        positions = 4
        while position < positions:
            translation = np.array([[cubePositions[colour][position][0],
                                     cubePositions[colour][position][1],
                                     cubePositions[colour][position][2]]])

            # Desired configuration
            T_des = np.concatenate((np.concatenate((orientation, translation.T), axis=1),
                                    np.array([[0, 0, 0, 1]])))

            # Make an initial guess and specify the acceptable error
            if colour == 0 or colour == 1:
                thetasInit = np.array([np.pi * 9.0 / 10, -np.pi * 2 / 3, 0, 0])
            else:
                thetasInit = np.array([-np.pi * 9.0 / 10, -np.pi * 2 / 3, 0, 0])

            errorOmega = 0.001
            errorPosition = 0.001

            thetasEnd, success = mr.IKinSpace(Screws.T, M, T_des, thetasInit, errorOmega, errorPosition)
            #thetasEnd = limitAngles(thetasEnd)
            T_calc = mr.FKinSpace(M, Screws.T, thetasEnd)
            print(success)

            cubeHomeAngles[colour][position] = thetasEnd
            position = position + 1
            """
            print("Starting Point M = {}".format(M))
            print("T_des = {}".format(T_des))
            print("T_calc = {}".format(T_calc))
            print("Did it work? {}".format(success))
            print("arm angles = {}".format(toDegrees(thetasEnd)))
            """
        colour = colour + 1

    return cubeHomeAngles

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
    """ Model parameters """
    z1 = 114 # mm height of the slew joint from origin
    y2 = 185 # mm length of armA
    y3 = 140 # mm length of armB
    z4 = 26.14 # mm height of claw
    r_6  = np.array([29.104, 29.104, 285.589]) # mm position of camera relative to frame{0}
    PITCH = 1 # For the vertical axis, joint 4

    """ Create the initial transformation and screws for all joint frames """
    T0_1, T0_2, T1_2, T2_3, T3_4, T6_5, T1_6 = np.zeros((7, 4, 4))

    # Joint angles in radians. This includes a joint that does not exist in the first position
    thetas = np.array([0., 0., 0., -1 * np.pi/4, 0.]) # thetas[0] is not a real joint. Used to so that index number is same as joint number.

    # Relative transformation matrices
    T0_1 = mr.RpToTrans(np.eye(3), np.array([0, 0, z1]))
    T1_2 = mr.RpToTrans(np.eye(3), np.array([0, y2, 0]))
    T2_3 = mr.RpToTrans(np.eye(3), np.array([0, y3, 0]))
    R3 = rot(np.array([0, 0, 1]), thetas[3])
    T3_4 = mr.RpToTrans(R3, np.array([0, 0, z4 - z1]))
    R4 = R3
    T0_6 = mr.RpToTrans(R4, r_6) # Camera pose relative to frame {0}

    # End effector position relative to home
    M = T0_1 @ T1_2 @ T2_3 @ T3_4

    # Frame distance from origin
    q1 = np.array([0, 0, z1])
    q2 = np.array([0, y2, z1])
    q3 = np.array([0, y2 + y3, z1])
    q4 = np.array([0, y2 + y3, z4])

    # Skew axis representation of rotation about z axis
    wz_skew = mr.VecToso3(np.array([0, 0, 1]))

    # Velocity vectors
    v1 = np.dot(-1 * wz_skew, q1)
    v2 = np.dot(-1 * wz_skew, q2)
    v3 = np.dot(-1 * wz_skew, q3)
    v4 = np.array([0, 0, PITCH]) # translation along z axis

    # Screws of each joint
    S1 = np.block([np.array([0, 0, 1]), v1])
    S2 = np.block([np.array([0, 0, 1]), v2])
    S3 = np.block([np.array([0, 0, 1]), v3])
    S4 = np.block([np.array([0, 0, 0]), v4])
    Screws = np.array([S1, S2, S3, S4])

    # Test Kinematics
    #testKinematics(M, Screws, thetas)

    # Space Jacobian just as an example
    Js = mr.JacobianSpace(Screws.T, thetas[1:])

    # Test Inverse Kinematics
    #testInverseKinematics(M, Screws)

    """ Get angle values for the cube locations """
    cubeHomeAngles = np.array(np.zeros((4, 4, 4)))
    cubeHomeAngles = initialiseCubeAngles(cubeHomeAngles)

    print(cubeHomeAngles)

