#!/usr/bin/env python
import rospy
from sensor_msgs.msg import JointState


def servo_pos(dyn1, dyn2, dyn3, dyn4):
    pub = rospy.Publisher("desired_joint_states", JointState, queue_size = 10)
    rospy.init_node('servo_pos', anonymous=True)
    r = rospy.Rate(10)

    pos = JointState()
    pos.name = ["joint_1", "joint_2". "joint_3", "joint_4"]
    pos.position = [dyn1, dyn2, dyn3, dyn4]
    pos.velocity = [0.50, 1.00, 1.00, 1.00]
 
    
    while not rospy.is_shutdown():
        pub.publish(pos)
        rospy.loginfo(pos)
        r.sleep()

if __name__ == '__main__':
    try:
        servo_pos()
    except rospy.ROSInterruptException:
        pass

