#!/usr/bin/env python3

import rospy
import RPi.GPIO as GPIO
import time

from std_msgs.msg import String
from control_logic_node.msg import CurrentJointState, DesJointState

ROBOT_FREQ = 10

class Servo_Controller:
    
    def cb_desired_js(data):
    from sensor_msgs.msg import JointState

    pub = rospy.Publisher("desired_joint_states", JointState, queue_size = 10)
    rospy.init_node('servo_pos', anonymous=True)
    r = rospy.Rate(10)
 
    pos = JointState()
    pos.name = ["joint_1", "joint_2". "joint_3", "joint_4"]
    pos.position = [data[0], data[1], data[2], data[3]]
    pos.velocity = [0.50, 1.00, 1.00, 1.00]

    sg90 = data[4]
    
    servo_pin = 13
    duty_cycle = 7.5     # Should be the centre for a SG90

    # Configure the Pi to use pin names (i.e. BCM) and allocate I/O
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(servo_pin, GPIO.OUT)

    # Create PWM channel on the servo pin with a frequency of 50Hz
    pwm_servo = GPIO.PWM(servo_pin, 50)
    pwm_servo.start(duty_cycle)




    def __init__(self):
        rospy.init_node('actuator_controller', anonymous=False)
        rate = rospy.Rate(ROBOT_FREQ)

        # Comms with Trajectory Planner
        rospy.Subscriber("Trajectory_DesJS", DesJointState, self.cb_desired_js)

        # Comms with Control Logic and Forward Kinematics
        self.current_joint_pub = rospy.Publisher("Actuator_CurrentJS", CurrentJointState, queue_size=10)

        while not rospy.is_shutdown():
        pub.publish(pos)
        rospy.loginfo(pos)
        r.sleep()
    
    

if __name__ == "__main__":
    try:
        Servo_Controller()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
