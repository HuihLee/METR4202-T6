###########
# Imports #
###########

import numpy as np
from math import *
import modern_robotics as mr
import rospy
from std_msgs.msg import Float64
from std_msgs.msg import Header
from geometry_msgs.msg import Pose
from sensor_msgs.msg import JointState
from message.msg import *
from tf.transformations import quaternion_matrix, rotation_matrix


class Traj:
    thetaStart = np.array([0,0,0,0,0])
    thetaEnd = np.array([0,0,0,0,0])
    duration = 0.0

    def __init__(self):
        
        # Initialize node
        rospy.init_node('Trajectory', anonymous=True)
        
        # Initialize boolean
        trajComplete = False
        
        # Initialize joint state
        jointState = DesJointState()
        jointState.thetas = thetaStart
        
        # Create publishers
        self.servoPub = rospy.Publisher('TargetJointState', TargetJointState, queue_size=1)
        self.controlPub = rospy.Publisher('TrajectoryComplete', TrajectoryComplete, queue_size=1)
        self.targetJointSub = rospy.Subscriber('TargetJointStateTrajectory', TargetJointStateTrajectory, self.cb_control_logic)
    
    def cb_control_logic(self, msg):
        Tf = 0 #Total Time
        t = 0 #current time
        method = 5
        
        thetaStart = np.array([msg.thetasCurrent[0], msg.thetasCurrent[1], msg.thetasCurrent[2], msg.thetasCurrent[3], msg.thetasCurrent[4]])
        thetaEnd = np.array([msg.thetasTarget[0], msg.thetasTarget[1], msg.thetasTarget[2], msg.thetasTarget[3], msg.thetasTarget[4]])
        duration = msg.motionDuration
        
        dt = 0.1
        N = ceil(duration/dt)
        trajectory = mr.JointTrajectory(thetaStart, thetaEnd, Tf, N, method)
        
        for way_point in trajectory:
            # every dt seconds publish next joint state until N
            jointState.thetas = [way_point[0], way_point[1], way_point[2], way_point[3], way_point[4]]
            rospy.sleep(dt)
            self.servoPub.publish(jointState)
        
        trajComplete = True
        self.controlPub.publish(trajComplete)
        

if __name__ == '__main__':
    try:
        Traj()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
        
        
