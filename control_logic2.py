from enum import Enum
import numpy as np
# ----
""" Camera logic """
# WAIT
# BAGGAGE_CAROUSEL_STOPPED
# GET_CUBE - determine the cube with the smallest x value (transform the pose)
# PUBLISH_CUBE_POSE - and colour

# ----
""" Trajectory logic """
# WAIT
# RECEIVE_JS_AND_TIME
# CALCULATE_TRAJECTORY
# PUBLISH_JS
#   for theta_i publish JS
# SEND_TRAJECTORY_COMPLETE

# ----
""" Inverse Kinematics logic """
# WAIT
# RECEIVE_POSITION
# CALCULATE_JS
# PUBLISH_JS

class ControlState(Enum):
    ERROR = 0
    SEARCHING = 1
    CALCULATE_IK = 2
    MOVE_OVER_CUBE = 3
    DOWN_PICKUP = 4
    CLAW_PICKUP = 5
    UP_PICKUP = 6
    CUBE_HOME = 7
    DOWN_DROP = 8
    CLAW_DROP = 9
    UP_DROP = 10


class ControlLogic:
    # Attributes here

    ibisState = ControlState.INITIALISE
    cubeFound = True
    trajectoryComplete = False
    targetJSReceived = False

    # cubePose = ([x, y, z, theta_z])
    cubePose = np.array([0, 0, 0, 0])
    currentJS = np.array([0, 0, 0, 0, 0])
    trajectoryComplete = Bool()
    trajectoryComplete = False
    targetJSReceived = Bool()
    targetJSReceived = False

    def __init__(self):

        self.pub = rospy.Publisher('joint_states', JointState, queue_size=10)
        self.sub = rospy.Subscriber('des_pose', Pose, self.cb_sub)


    # Get cube home positions
    # Setup subs and pubs
    # Calibrate arm

    def cb_cubePose(self, msg):
        self.cubePose = np.array([msg.position[0],
                                  msg.position[1],
                                  msg.position[2],
                                  msg.position[3]])
        self.cubeFound = True

    def cb_current_js(self, msg):
        self.currentJS = np.array([msg.position[0],
                                   msg.position[1],
                                   msg.position[2],
                                   msg.position[3],
                                   msg.position[4]])

    def cb_trajectory_complete(self, msg):
        self.trajectoryComplete = True

    def cb_target_js(self, msg):
        self.currentJS = np.array([msg.position[0],
                                   msg.position[1],
                                   msg.position[2],
                                   msg.position[3],
                                   msg.position[4]])
        self.targetJSReceived = True

    def control_loop(self):
        ibisState = self.ibisState
        cubeFound = self.cubeFound
        trajectoryComplete = self.trajectoryComplete
        targetJSReceived = self.targetJSReceived

        # Set to home
        # INITIALISE:
        match ibisState:
            case SEARCHING:
                # Move home
                if cubeFound is True:
                    cubePose = get_cube_pose()
                    """ Receive cube pose from the camera """
                    # ik_pub(cubePose)
                    ibisState = ControlState.CALCULATE_IK
            case CALCULATE_IK:
                """ request IK """
                if targetJSReceived is True:
                    ibisState = ControlState.MOVE_OVER_CUBE
                    # publish jointstate to trajectory
                    trajectoryComplete = False
            case MOVE_OVER_CUBE:
                if trajectoryComplete is True:
                    ibisState = ControlState.MOVE_DOWN
                    # publish jointstate to trajectory
                    trajectoryComplete = False
            case DOWN_PICKUP:
                if trajectoryComplete is True:
                    ibisState = ControlState.CLAW_PICKUP
                    # publish jointstate to trajectory
                    trajectoryComplete = False
            case CLAW_PICKUP:
                if trajectoryComplete is True:
                    ibisState = ControlState.UP_PICKUP
                    # publish jointstate to trajectory
                    trajectoryComplete = False
            case UP_PICKUP:
                if trajectoryComplete is True:
                    ibisState = ControlState.CUBE_HOME
                    # publish jointstate to trajectory
                    trajectoryComplete = False
            case CUBE_HOME:
                # get the colour home
                if trajectoryComplete is True:
                    ibisState = ControlState.DOWN_DROP
                    # publish jointstate to trajectory
                    trajectoryComplete = False
            case DOWN_DROP:
                if trajectoryComplete is True:
                    ibisState = ControlState.CLAW_DROP
                    # publish jointstate to trajectory
                    trajectoryComplete = False
            case CLAW_DROP:
                if trajectoryComplete is True:
                    ibisState = ControlState.UP_DROP
                    # publish jointstate to trajectory
                    trajectoryComplete = False
            case UP_DROP:
                if trajectoryComplete is True:
                    ibisState = ControlState.SEARCHING
                    # publish jointstate to trajectory
                    trajectoryComplete = False


if __name__ == '__main__':
# Initialise variables
