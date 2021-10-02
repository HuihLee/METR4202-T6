#!/usr/bin/env python3

import rospy
from std_msgs.msg import String

ROBOT_FREQ = 10

def init_camera_node():
    rospy.init_node('camera', anonymous=False)
    rate = rospy.Rate(ROBOT_FREQ)

    rospy.Publisher("aruco_identity", String, queue_size=10)

    while not rospy.is_shutdown():
        rate.sleep()

if __name__ == "__main__":
    try:
        init_camera_node()
    except rospy.ROSInterruptException:
        pass