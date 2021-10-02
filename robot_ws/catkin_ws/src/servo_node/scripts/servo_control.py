#!/usr/bin/env python3

import rospy
from std_msgs.msg import String

ROBOT_FREQ = 10

def position_callback(data):
    print("robot_controller recieved: {} from planner".format(data))


def init_controller_node():
    rospy.init_node('servo_controller', anonymous=False)
    rate = rospy.Rate(ROBOT_FREQ)

    rospy.Subscriber("desired_servo_position", String, position_callback)

    rospy.Publisher("servo_position", String, queue_size=10)

    while not rospy.is_shutdown():
        rate.sleep()

if __name__ == '__main__':
    try:
        init_controller_node()
    except rospy.ROSInterruptException:
        pass