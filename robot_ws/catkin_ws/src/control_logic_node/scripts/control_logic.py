#!/usr/bin/env python3
import rospy
from enum import Enum
import numpy as np

from control_logic_node.msg import TargetJointStateTrajectory, CubePose, DesPosition
from control_logic_node.msg import TargetJointState, TrajectoryComplete, CurrentJointState, ClawPose

"""
import rospy
from Colour.py import Colour
"""
"""
from std_msgs.msg import Float64
from std_msgs.msg import Bool
from std_msgs.msg import Header
from geometry_msgs.msg import Pose
from sensor_msgs.msg import JointState
"""
"""
# importing sys to import files from different folders
import sys
sys.path.insert(0, '') #hierarchy -> '/home/user/folders'
sys.path.insert(0, '')
sys.path.insert(0, '')
sys.path.insert(0, '')
"""

# import all py files from different packages
"""
from import * 
from import *
from import *
from import *
"""

""" Different states of the ibis arm"""


class ControlState(Enum):
    ERROR = 0  # Something has gone wrong
    SEARCHING = 1  # Searching for a cube to pick up
    CALCULATE_IK = 2  # Calculate the joint angles to pick up cube
    MOVE_OVER_CUBE = 3  # Arm moving over the top of the cube
    DOWN_PICKUP = 4  # Arm moving down to the cube to pickup
    CLAW_PICKUP = 5  # Gripping the cube
    UP_PICKUP = 6  # Lifting the cube up
    CUBE_HOME = 7  # Moving to the cube home location
    DOWN_DROP = 8  # Arm moving down to cube home
    CLAW_DROP = 9  # Arm dropping the cube
    UP_DROP = 10  # Arm moving up from drop off
    ZERO = 11  # All angles at home positions


class Colour(Enum):
    RED = 0
    GREEN = 1
    BLUE = 2
    YELLOW = 3
    UNKNOWN = 4


class ControlLogic:
    """ Attributes here """
    ibisState = ControlState.SEARCHING  # State of the main control logic
    cubeFound = False  # Cube location has not yet been determined
    trajectoryComplete = False  # No trajectory is underway
    targetJSReceived = False  # No joint states have been received

    cubePosition = [0, 0, 0, 0]  # ([x, y, z, theta_z])
    currentJS = [0, 0, 0, 0, 0]  # ([theta1, theta2, theta3, theta4, theta5])
    targetJS = [0, 0, 0, 0, 0]  # ([theta1, theta2, theta3, theta4, theta5])
    cube_home = [RED, GREEN, BLUE, YELLOW]    # Index is left to right of block homes, integers are colours defined by enum 
    cubeHomeJS = [currentJS] * (len(Colour) - 1)  # Create an array of cubeHome
    cubeColour = Colour.UNKNOWN

    CLAW_UP_Z = 100  # rad
    CLAW_DOWN_Z = 5  # rad
    CLAW_OPEN = 100  # rad
    CLAW_CLOSE = 120  # rad

    OVER_CUBE_TIME = 2  # sec
    UP_DOWN_TIME = 1  # sec
    CLAW_OPEN_CLOSE_TIME = 0.2  # sec
    CUBE_HOME_TIME = 6  # sec

    """ Callbacks for subscribers """

    # Callback for cube pose subscription
    def cb_cubePose(self, msg):
        cubePosition = msg.position
        cubeColour = Colour[msg.colour]
        cubeFound = True

    # Callback for current joint state subscription
    def cb_current_js(self, msg):
        currentJS = msg.thetas

    # Callback for trajectory complete sub
    def cb_trajectory_complete(self, msg):
        trajectoryComplete = True

    # Callback for target js sub
    def cb_target_js(self, msg):
        currentJS = msg.thetas
        targetJSReceived = True

    def __init__(self):
        # Initialize node
        rospy.init_node('Control_Logic', anonymous=False)

        # Comms with IK node
        self.IK_pub = rospy.Publisher('CL_Position',
                                      DesPosition,
                                      queue_size=1)
        self.IK_sub = rospy.Subscriber('IK_JS',
                                       TargetJointState,
                                       self.cb_target_js)
        # Comms with Trajectory
        self.trajectory_pub = rospy.Publisher('CL_TargetJS',
                                              TargetJointStateTrajectory,
                                              queue_size=1)
        self.trajectory_sub = rospy.Subscriber('Trajectory_Status',
                                               TrajectoryComplete,
                                               self.cb_trajectory_complete)
        # Comms with Camera
        self.camera_sub = rospy.Subscriber('Camera_Pose',
                                           CubePose,
                                           self.cb_cubePose)
        # Comms with actuator
        self.actuator_sub = rospy.Subscriber('Actuator_CurrentJS',
                                             CurrentJointState,
                                             self.cb_current_js)

        # Comms with FK
        """Are we using FK node??? I am confused on the structure now"""

        # Get block home positions from user
        cube_home = get_block_homes()

    """ Actions from state machine """

    def get_block_homes(self):
        colour_string = input('From left to right, what is the colour order?: ')
        colours = colour_string.split(',')
        position = np.empty(4, dtype=int)
        position_val = 0
        for colour in colours:
            if colour == "red":
                position[position_val] = 0
            elif colour == "green":
                position[position_val] = 1
            elif colour == "blue":
                position[position_val] = 2
            elif colour == "yellow":
                position[position_val] = 3
            else:
                print("unknown string value...")
            position_val = position_val+1
        return position

    def calculate_JS(self):
        msg = DesPosition()
        msg.position = self.cubePose

        self.IK_pub.publish(msg)

    def move(self, thetasTarget, movementDuration):
        msg = TargetJSTrajectory()
        msg.thetasTarget = thetasTarget
        msg.thetasCurrent = self.currentJS
        msg.movementDuration = movementDuration
        self.trajectoryComplete = False
        self.trajectory_pub.publish(msg)

    def move_over_cube(self):
        thetasTarget = [self.targetJS[0],
                        self.targetJS[1],
                        self.targetJS[2],
                        self.CLAW_UP_Z,
                        self.CLAW_OPEN]
        movementDuration = self.OVER_CUBE_TIME
        self.move(thetasTarget, movementDuration)

    def down_pickup(self):
        thetasTarget = [self.targetJS[0],
                        self.targetJS[1],
                        self.targetJS[2],
                        self.CLAW_DOWN_Z,
                        self.CLAW_OPEN]
        self.move(thetasTarget, self.UP_DOWN_TIME)

    def claw_pickup(self):
        thetasTarget = [self.targetJS[0],
                        self.targetJS[1],
                        self.targetJS[2],
                        self.CLAW_DOWN_Z,
                        self.CLAW_CLOSE]
        self.move(thetasTarget, self.CLAW_OPEN_CLOSE_TIME)

    def up_pickup(self):
        thetasTarget = [self.targetJS[0],
                        self.targetJS[1],
                        self.targetJS[2],
                        self.CLAW_UP_Z,
                        self.CLAW_CLOSE]
        self.move(thetasTarget, self.UP_DOWN_TIME)

    def cube_home(self):
        targetJS = self.get_cube_home_JS(self.cubeColour)
        thetasTarget = [self.targetJS[0],
                        self.targetJS[1],
                        self.targetJS[2],
                        self.CLAW_UP_Z,
                        self.CLAW_CLOSE]
        self.move(thetasTarget, self.CUBE_HOME_TIME)

    def down_drop(self):
        thetasTarget = [self.targetJS[0],
                        self.targetJS[1],
                        self.targetJS[2],
                        self.CLAW_DOWN_Z,
                        self.CLAW_CLOSE]
        self.move(thetasTarget, self.UP_DOWN_TIME)

    def claw_drop(self):
        thetasTarget = [self.targetJS[0],
                        self.targetJS[1],
                        self.targetJS[2],
                        self.CLAW_DOWN_Z,
                        self.CLAW_OPEN]
        self.move(thetasTarget, self.CLAW_OPEN_CLOSE_TIME)

    def up_drop(self):
        thetasTarget = [self.targetJS[0],
                        self.targetJS[1],
                        self.targetJS[2],
                        self.CLAW_DOWN_Z,
                        self.CLAW_OPEN]
        self.move(thetasTarget, self.CLAW_OPEN_CLOSE_TIME)

    """ Main control loop """

    def control_loop(self): # had to change to basic if switch case due to python version issues
        # Set to home
        # match self.ibisState:
        if self.ibisState is ControlState.SEARCHING:
        # case ControlState.SEARCHING:
            # searching()
            if self.cubeFound is True:
                """ Receive cube pose from the camera """
                self.ibisState = ControlState.CALCULATE_IK
        if self.ibisState is ControlState.CALCULATE_IK:
        # case ControlState.CALCULATE_IK:
            self.calculate_JS()
            if self.targetJSReceived is True:
                self.ibisState = ControlState.MOVE_OVER_CUBE
                self.targetJSReceived = False
        if self.ibisState is ControlState.MOVE_OVER_CUBE:
        # case ControlState.MOVE_OVER_CUBE:
            self.move_over_cube()
            if self.trajectoryComplete is True:
                self.ibisState = ControlState.MOVE_DOWN
                self.trajectoryComplete = False
        if self.ibisState is ControlState.DOWN_PICKUP:
        # case ControlState.DOWN_PICKUP:
            self.down_pickup()
            if self.trajectoryComplete is True:
                self.ibisState = ControlState.CLAW_PICKUP
                self.trajectoryComplete = False
        if self.ibisState is ControlState.CLAW_PICKUP:
        # case ControlState.CLAW_PICKUP:
            self.claw_pickup()
            if self.trajectoryComplete is True:
                self.ibisState = ControlState.UP_PICKUP
                self.trajectoryComplete = False
        if self.ibisState is ControlState.UP_PICKUP:
        # case ControlState.UP_PICKUP:
            self.up_pickup()
            if self.trajectoryComplete is True:
                self.ibisState = ControlState.CUBE_HOME
                self.trajectoryComplete = False
        if self.ibisState is ControlState.CUBE_HOME:
        # case ControlState.CUBE_HOME:
            self.cube_home()
            if self.trajectoryComplete is True:
                self.ibisState = ControlState.DOWN_DROP
                self.trajectoryComplete = False
        if self.ibisState is ControlState.DOWN_DROP:
        # case ControlState.DOWN_DROP:
            self.down_drop()
            if self.trajectoryComplete is True:
                self.ibisState = ControlState.CLAW_DROP
                self.trajectoryComplete = False
        if self.ibisState is ControlState.CLAW_DROP:
        # case ControlState.CLAW_DROP:
            self.claw_drop()
            if self.trajectoryComplete is True:
                self.ibisState = ControlState.UP_DROP
                self.trajectoryComplete = False
        if self.ibisState is ControlState.UP_DROP:
        # case ControlState.UP_DROP:
            self.up_drop()
            if self.trajectoryComplete is True:
                self.ibisState = ControlState.SEARCHING
                self.trajectoryComplete = False


if __name__ == '__main__':
    try:
        ControlLogic()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
