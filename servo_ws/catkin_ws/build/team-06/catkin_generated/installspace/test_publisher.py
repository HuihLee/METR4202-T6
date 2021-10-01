#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import JointState

#pos.name = ["joint_1", "joint_2", "joint_3"]
#pos.position = [2.000, -2.000, 1.000]
#pos.velocity = [3.00, 3.00 ,3.00]
def test():
    pub = rospy.Publisher("desired_joint_states", JointState, queue_size = 10)
    rospy.init_node('test_node', anonymous=True)

    r = rospy.Rate(10)

    pos = JointState()
    pos.name = ["joint_1"]
    pos.position = [2.000]
    pos.velocity = [3.00]
    while not rospy.is_shutdown():
        pub.publish(pos)
        rospy.loginfo(pos)
        r.sleep()

if __name__ == '__main__':
    try:
        test()
    except rospy.ROSInterruptException:
        pass

