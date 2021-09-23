import numpy as np
import modern_robotics as mr

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

"""
This script primarily focuses on the transformations, kinematics and inverse
kinematics of the robot arm for METR4202. The following robot has the following
parts 

Part        | Params                | Description       
-------------------------------------------------------
origin      |                       | Located at the bottom of the slew axis of rotation
armA        | frame{1} S1 theta1 z1 | The largest link. Associated with joint1
armB        | frame{2} S2 theta2 y1 | Adjacent to armA. Associated with joint2
couple      | frame{3} S3 theta3 y2 | 
claw        | frame{4} S4 theta4 z3 | 
cube        | frame{5} S5           | cube to pick up 
camera      | frame{6} S6 z6        | camera mounted on armA
"""

if __name__ == '__main__':
    """ Model parameters """
    z1 = 114 # mm height of the slew joint from origin
    y1 = 185 # mm length of armA
    y2 = 140 # mm length of armB
    z3 = 100 # mm height of claw
    r_6  = np.array([10, 10, 100]) # mm position of camera relative to frame{1}

    """ Create the initial transformation and screws for all joint frames """
    T0_1, T0_2, T1_2, T2_3, T3_4, T6_5, T1_6 = np.zeros((7, 4, 4))

    # Joint angles in radians. This includes an joint that does not exist in the first position
    thetas = np.array([0, 0, 0, 0, 0]) # thetas[0] is not a real joint

    # Relative transformation matrices
    T0_1 = mr.RpToTrans(np.eye(3), np.array([0, 0, z1]))
    T1_2 = mr.RpToTrans(np.eye(3), np.array([0, y1, 0]))
    T2_3 = mr.RpToTrans(np.eye(3), np.array([0, y2, 0]))
    R3 = rot(np.array([0, 0, 1]), thetas[3])
    T3_4 = mr.RpToTrans(R3, np.array([0, 0, 0]))
    T1_6 = mr.RpToTrans(np.eye(3), r_6) # Camera pose relative to frame {1}

    S1 = np.array([0, 0, 0, 0, 0, z1])
    S2 = np.array([0, 0, 0, 0, y1, z1])
    S3 = np.array([0, 0, 0, 0, y1 + y2, z1])
    S4 = np.array([0, 0, 0, 0, y1 + y2, z3])
    Screws = np.array([S1, S2, S3, S4])

    # Convert these screws to transformations
    T0_1 = mr.MatrixExp6(mr.VecTose3(S1))
    T0_2 = mr.MatrixExp6(mr.VecTose3(S2))
    T0_3 = mr.MatrixExp6(mr.VecTose3(S3))
    T0_4 = mr.MatrixExp6(mr.VecTose3(S3))

    # End effector position relative to home
    M = T0_4
