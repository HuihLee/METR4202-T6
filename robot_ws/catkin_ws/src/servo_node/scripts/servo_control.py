#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
from control_logic_node.msg import CurrentJointState, DesJointState

ROBOT_FREQ = 10

def cb_desired_js(data):
    print(data)

def init_planner_node():
    rospy.init_node('actuator_controller', anonymous=False)
    rate = rospy.Rate(ROBOT_FREQ)

    # Comms with Trajectory Planner
    rospy.Subscriber("Trajectory_DesJS", DesJointState, cb_desired_js)

    # Comms with Control Logic and Forward Kinematics
    current_joint_pub = rospy.Publisher("Actuator_CurrentJS", CurrentJointState, queue_size=10)

    
    while not rospy.is_shutdown():
        rate.sleep()

if __name__ == "__main__":
    try:
        init_planner_node()
    except rospy.ROSInterruptException:
        pass