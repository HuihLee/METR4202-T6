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
    R1C = np.array([[0, 0, 1],
                    [1, 0, 0],
                    [0, 1, 0]]) # z aligns with the x axis
    RC6 = rot(np.array([0, 1, 0]), -1 * np.pi / 4) # rotate around the y axis
    R06 = np.matmul(R1C, RC6)
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

    # Test Kinematics
    # testKinematics(M, Screws, thetas)

    def __init__(self)
        # Initialize node
        rospy.init_node('Forward_Kinematics', anonymous=True)
        # Publish
        self.pub = rospy.Publisher('IK_JS', TargetJointState, queue_size=1)
        # Subscribe
        self.sub = rospy.Subscriber('CL_Position', DesPosition, self.cb_calculate_ik)
