###########
# Imports #
###########

import numpy as np
from math import *
import modern_robotics as mr
import rospy
from std_msgs.msg import Float64
from std_msgs.msg import Bool
from std_msgs.msg import Header
from geometry_msgs.msg import Pose
from sensor_msgs.msg import JointState
from tf.transformations import quaternion_matrix, rotation_matrix


class Traj:
    thetaStart = np.array([0,0,0,0,0])
    thetaEnd = np.array([0,0,0,0,0])
    time = 0.0

    def __init__(self):
        #Initialize node
        rospy.init_node('Traj_3R_Robot', anonymous=True)
        #initialize boolean
        trajComplete = Bool()
        trajComplete = False
        
        #Create publishers
        self.servoPub = rospy.Publisher('desiredJointState', JointState, queue_size=10)
        self.controlPub = rospy.Publisher('trajectoryComplete', Boolmsg, queue_size=10)
        self.targetJointSub = rospy.Subscriber('targetJointStateTrajectory', tragetJointStateTrajectory, self.cb_servos)
    
    def cb_servo(self, msg):
        Tf = 0 #Total Time
        t = 0 #current time
        thetaStart = np.array([msg.startpos[0], msg.startpos[1], msg.startpos[2], msg.startpos[3], msg.startpos[4]])
        thetaEnd = np.array([msg.endpos[0], msg.startpos[1], msg.startpos[2], msg.startpos[3], msg.startpos[4]])
        duration = msg.duration
        s(t) = mr.QuinticTimeScaling(Tf, t)
        trajectory = mr.JointTrajectory(thetastart, thetaend, Tf, N, 5)
        for point in trajectory
            self.servoPub.publish('desiredJointState')
        trajComplete = True
        self.controlPub.pub(trajComplete)
        
        

if __name__ == '__main__':
    try:
        Traj()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
        
        
