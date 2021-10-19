#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
from control_logic_node.msg import CurrentJointState, DesJointState

ROBOT_FREQ = 10

class Servo_Contoller:
    
    def cb_desired_js(data):
            print(data)

    def __init__(self):
        rospy.init_node('actuator_controller', anonymous=False)
        rate = rospy.Rate(ROBOT_FREQ)

        # Comms with Trajectory Planner
        rospy.Subscriber("Trajectory_DesJS", DesJointState, self.cb_desired_js)

        # Comms with Control Logic and Forward Kinematics
        self.current_joint_pub = rospy.Publisher("Actuator_CurrentJS", CurrentJointState, queue_size=10)

    
        


if __name__ == "__main__":
    try:
        Servo_Contoller()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass