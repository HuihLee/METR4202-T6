#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
from control_logic_node.msg import TargetJointStateTrajectory, TrajectoryComplete, DesJointState

ROBOT_FREQ = 10

def cb_target_js(data):
    print(data)

def init_planner_node():
    rospy.init_node('trajectory_planner', anonymous=False)
    rate = rospy.Rate(ROBOT_FREQ)

    # Comms with Control Logic
    trajectory_complete_pub = rospy.Publisher("Trajectory_Status", TrajectoryComplete, queue_size=10)
    rospy.Subscriber("CL_TargetJS", TargetJointStateTrajectory, cb_target_js)

    # Comms with servo controller
    des_joint_pub = rospy.Publisher("Trajectory_DesJS", DesJointState, queue_size=10)

    
    while not rospy.is_shutdown():
        rate.sleep()

if __name__ == "__main__":
    try:
        init_planner_node()
    except rospy.ROSInterruptException:
        pass