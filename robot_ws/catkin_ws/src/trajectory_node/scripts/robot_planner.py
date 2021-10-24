#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
from control_logic_node.msg import TargetJointStateTrajectory, TrajectoryComplete, DesJointState
from tf.transformations import quaternion_matrix, rotation_matrix

# dependancies
from math import *
import numpy as np
import modern_robotics as mr

ROBOT_FREQ = 10

class Traj:

    def cb_control_logic(self, msg):
        Tf = msg.motionDuration #Total Time
        method = 5
        
        thetaStart = np.array([msg.thetasCurrent[0], msg.thetasCurrent[1], msg.thetasCurrent[2], msg.thetasCurrent[3], msg.thetasCurrent[4]])
        thetaEnd = np.array([msg.thetasTarget[0], msg.thetasTarget[1], msg.thetasTarget[2], msg.thetasTarget[3], msg.thetasTarget[4]])
        duration = msg.motionDuration

        dt = 0.05
        rate = rospy.Rate(1 / dt)
        N = ceil(duration/dt)
        trajectory = mr.JointTrajectory(thetaStart, thetaEnd, Tf, N, method)
        
        for way_point in trajectory:
            # every dt seconds publish next joint state until N
            self.jointState.thetas = [way_point[0], way_point[1], way_point[2], way_point[3], way_point[4]]

            rate.sleep() #FIXME - is the necessary?
            self.servoPub.publish(self.jointState)
        
        self.trajComplete = True
        self.controlPub.publish(self.trajComplete)

    def __init__(self):
        rospy.init_node('Trajectory', anonymous=True)

        # inti messages
        self.jointState = DesJointState()
        self.trajComplete = TrajectoryComplete()
        self.trajComplete = False

        # Create publishers
        self.servoPub = rospy.Publisher('Trajectory_DesJS', DesJointState, queue_size=10)
        self.controlPub = rospy.Publisher('Trajectory_Status', TrajectoryComplete, queue_size=10)

        # Create subscribers
        self.targetJointSub = rospy.Subscriber('CL_TargetJS', TargetJointStateTrajectory, self.cb_control_logic)


if __name__ == "__main__":
    try:
        Traj()
        rospy.spin()
    except rospy.ROSInterruptException:
        print("trajectory node has stopped...")
        pass
