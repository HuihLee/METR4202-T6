from enum import Enum
import numpy as np
import rospy
from std_msgs.msg import Float64
from std_msgs.msg import Bool
from std_msgs.msg import Header
from geometry_msgs.msg import Pose
from sensor_msgs.msg import JointState

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

""" Different states of the ibis arm"""
class ControlState(Enum):
    ERROR = 0 # Something has gone wrong
    SEARCHING = 1 # Searching for a cube to pick up
    CALCULATE_IK = 2 # Calculate the joint angles to pick up cube
    MOVE_OVER_CUBE = 3 # Arm moving over the top of the cube
    DOWN_PICKUP = 4 # Arm moving down to the cube to pickup
    CLAW_PICKUP = 5 # Gripping the cube
    UP_PICKUP = 6 # Lifting the cube up
    CUBE_HOME = 7 # Moving to the cube home location
    DOWN_DROP = 8 # Arm moving down to cube home
    CLAW_DROP = 9 # Arm dropping the cube
    UP_DROP = 10 # Arm moving up from drop off

class Colour(Enum):
    UNKNOWN = 0
    RED = 1
    GREEN = 2
    BLUE = 3
    YELLOW = 4

class ControlLogic:
    """ Attributes here """
    ibisState = ControlState.SEARCHING
    cubeFound = False # Cube location has not yet been determined
    trajectoryComplete = False # No trajectory is underway
    targetJSReceived = False # No joint states have been received

    cubePosition = [0, 0, 0, 0] # ([x, y, z, theta_z])
    currentJS = [0, 0, 0, 0, 0] # ([theta1, theta2, theta3, theta4, theta5])
    targetJS = [0, 0, 0, 0, 0] # ([theta1, theta2, theta3, theta4, theta5])
    cubeColour = Colour.UNKNOWN

    CLAW_UP_Z = 100 # mm
    CLAW_DOWN_Z = 5 # mm

    OVER_CUBE_TIME = 2 # sec
    UP_DOWN_TIME = 1 # sec
    CLAW_CLOSE_TIME = 0.2 # sec
    CUBE_HOME_TIME = 6 # sec

    def __init__(self):

        # Comms with IK node
        self.IK_pub = rospy.Publisher('InverseKinematicsPub',
                                               DesPosition,
                                               queue_size=1)
        self.IK_sub = rospy.Subscriber('InverseKinematicsSub',
                                                 TargetJS,
                                                 cb_target_js)
        # Comms with Trajectory
        self.trajectory_pub = rospy.Publisher('TrajectoryPub',
                                               TargetJSTrajectory,
                                               queue_size=1)
        self.trajectory_sub = rospy.Subscriber('TrajectorySub',
                                                 TrajectoryComplete,
                                                 cb_trajectory_complete)
        # Comms with Camera
        self.camera_sub = rospy.Subscriber('cubePose_sub',
                                                 CubePose,
                                                 cb_cubePose)
        # Comms with actuator
        self.actuator_sub = rospy.Subscriber('currentJS_sub',
                                                 CurrentJS,
                                                 cb_currentJS)

    """ Callbacks for subscribers """
    # Callback for cube pose subscription
    def cb_cubePose(self, msg):
        self.cubePosition = msg.position
        self.cubeColour = Colour[msg.colour]
        self.cubeFound = True

    # Callback for current joint state subscription
    def cb_current_js(self, msg):
        self.currentJS = msg.thetas

    # Callback for trajectory complete sub
    def cb_trajectory_complete(self, msg):
        self.trajectoryComplete = True

    # Callback for target js sub
    def cb_target_JS(self, msg):
        self.currentJS = msg.thetas
        self.targetJSReceived = True

    """ Actions from state machine """
    def calculate_JS(self):
        msg = DesPosition()
        msg.position = self.cubePose

        self.IK_pub.publish(msg)

    def move_over_cube(self):
        msg = TargetJSTrajectory()
        msg.thetasTarget = [self.targetJS[0],
                            self.targetJS[1],
                            self.targetJS[2],
                            self.CLAW_UP_Z,
                            self.CLAW_OPEN]
        msg.thetasCurrent = [self.currentJS[0],
                            self.currentJS[1],
                            self.currentJS[2],
                            self.currentJS[3],
                            self.currentJS[4]]
        msg.movementDuration = self.OVER_CUBE_TIME
        self.trajectory_pub.publish(msg)
        self.trajectoryComplete = False

    def down_pickup(self):
        msg = TargetJSTrajectory()
        msg.thetasTarget = [self.targetJS[0],
                            self.targetJS[1],
                            self.targetJS[2],
                            self.CLAW_UP_Z,
                            self.CLAW_OPEN]
        msg.thetasCurrent = [self.currentJS[0],
                            self.currentJS[1],
                            self.currentJS[2],
                            self.currentJS[3],
                            self.currentJS[4]]
        msg.movementDuration = self.CUBE_DOWN_TIME
        self.trajectory_pub.publish(msg)
        self.trajectoryComplete = False

    def claw_pickup(self):
        msg = TargetJSTrajectory()
        msg.thetasTarget = [self.targetJS[0],
                            self.targetJS[1],
                            self.targetJS[2],
                            self.CLAW_UP_Z,
                            self.CLAW_CLOSE]
        msg.thetasCurrent = [self.currentJS[0],
                            self.currentJS[1],
                            self.currentJS[2],
                            self.currentJS[3],
                            self.currentJS[4]]
        msg.movementDuration = self.CUBE_CLOSE_TIME
        self.trajectory_pub.publish(msg)
        self.trajectoryComplete = False

    """ Main control loop """
    def control_loop(self):
        ibisState = self.ibisState
        cubeFound = self.cubeFound
        trajectoryComplete = self.trajectoryComplete
        targetJSReceived = self.targetJSReceived

        # Set to home
        # INITIALISE:
        match ibisState:
            case SEARCHING:
                # searching()
                if cubeFound is True:
                    """ Receive cube pose from the camera """
                    ibisState = ControlState.CALCULATE_IK
            case CALCULATE_IK:
                calculate_JS()
                if targetJSReceived is True:
                    ibisState = ControlState.MOVE_OVER_CUBE
            case MOVE_OVER_CUBE:
                move_over_cube()
                if trajectoryComplete is True:
                    ibisState = ControlState.MOVE_DOWN
            case DOWN_PICKUP:
                down_pickup()
                if trajectoryComplete is True:
                    ibisState = ControlState.CLAW_PICKUP
            case CLAW_PICKUP:
                claw_pickup()
                if trajectoryComplete is True:
                    ibisState = ControlState.UP_PICKUP
            case UP_PICKUP:
                # up_pickup()
                if trajectoryComplete is True:
                    ibisState = ControlState.CUBE_HOME
            case CUBE_HOME:
                # cube_home()
                if trajectoryComplete is True:
                    ibisState = ControlState.DOWN_DROP
            case DOWN_DROP:
                # down_drop()
                if trajectoryComplete is True:
                    ibisState = ControlState.CLAW_DROP
            case CLAW_DROP:
                # claw_drop()
                if trajectoryComplete is True:
                    ibisState = ControlState.UP_DROP
            case UP_DROP:
                # up_drop()
                if trajectoryComplete is True:
                    ibisState = ControlState.SEARCHING



if __name__ == '__main__':
# Initialise variables
