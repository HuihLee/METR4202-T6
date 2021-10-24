import numpy as np
import modern_robotics as mr

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

thetas_0_C =  [0, 1, 2, 3]
thetas_arm = [0, 1, 2]

R0_1 = rot(np.array([0, 0, 1]), thetas_arm[0])
R1_2 = rot(np.array([0, 0, 1]), thetas_arm[1])
R2_3_A = rot(np.array([0, 1, 1]), np.pi)
R2_3_B = rot(np.array([0, 0, 1]), thetas_arm[2])


for angle in thetas_0_C:
    R0_C = rot(np.array([0, 0, 1]), angle)
    R1_C = mr.RotInv(R0_1) @ R0_C
    print(R1_C)
    print(np.arctan2(R1_C[1][0], R1_C[0][0]))
    R2_C = mr.RotInv(R1_2) @ R1_C
    print(R2_C)
    print(np.arctan2(R2_C[1][0], R2_C[0][0]))
    R3_C = mr.RotInv(R2_3_B) @ mr.RotInv(R2_3_A) @ R2_C
    print(R3_C)
    print(np.arctan2(R3_C[1][0], R3_C[0][0]))
    print("----")


def calculate_claw_angles():
    # do nothing
    hello = 1

if __name__ == '__main__':
    calculate_claw_angles()