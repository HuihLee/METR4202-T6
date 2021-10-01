#!/usr/bin/env python3

import rospy
from std_msgs.msg import String

ROBOT_FREQ = 10

def aruco_callback(data):
    print("robot_planner recieved: {} from aruco".format(data))
    
def servo_callback(data):
    print("robot_planner recieved: {} from servos".format(data))

def init_planner_node():
    rospy.init_node('robot_planner', anonymous=False)
    rate = rospy.Rate(ROBOT_FREQ)

    rospy.Subscriber("aruco_identity", String, aruco_callback)
    rospy.Subscriber("servo_position", String, servo_callback)

    rospy.Publisher("desired_servo_position", String, queue_size=10)
    
    while not rospy.is_shutdown():
        rate.sleep()

if __name__ == "__main__":
    try:
        init_planner_node()
    except rospy.ROSInterruptException:
        pass