#!/usr/bin/env python3
import rospy
import RPi.GPIO as GPIO
import time

from std_msgs.msg import String
from control_logic_node.msg import CurrentJointState, DesJointState
from sensor_msgs.msg import JointState

ROBOT_FREQ = 10

class Servo_Controller:

    # Desired joint states for all the servos
    def cb_desired_js(self, data):
        self.pos = JointState()
        self.pos.name = ["joint_1", "joint_2", "joint_3", "joint_4"]
        self.pos.position = [data[0], data[1], data[2], data[3]]
        self.pos.velocity = [0.50, 1.00, 1.00, 1.00]
        # Sets the position of the SG90 servo
        self.SG90 = data[4]

    # Current dynamixel joint states
    def cb_current_js(self, data):
       self.currentJointPos = data.append(self.SG90)

    # Closes the gripper when the threshold pi/2 is passed through
    def gripperControl(self, rad):
        if rad < 1.57:
            self.duty_cycle = self.openPose
        else:
            self.duty_cycle = self.closePose
        return self.duty_cycle


    def __init__(self):
        rospy.init_node('actuator_controller', anonymous=False)
        rate = rospy.Rate(ROBOT_FREQ)

        # Comms with Dynamixels
        self.dynamixel_pub = rospy.Publisher("desired_joint_state", JointState, queue_size=10)
        self.dynamixel_sub = rospy.Subscriber("joint_states", JointState, self.cb_current_js)

        # Comms with Trajectory Planner
        rospy.Subscriber("Trajectory_DesJS", DesJointState, self.cb_desired_js)

        # Comms with Control Logic and Forward Kinematics
        self.current_joint_pub = rospy.Publisher("Actuator_CurrentJS", CurrentJointState, queue_size=10)

        # Duty cycle to close the gripper
        self.openPose = 8.1
        # Duty cycle to open the gripper
        self.closePose = 7.2

        # Configure the Pi to use pin names (i.e. BCM) and allocate I/O
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(13, GPIO.OUT)

        # Create PWM channel on pin 13 with a frequency of 50Hz
        pwm_servo = GPIO.PWM(13, 50)
        pwm_servo.start(self.closePose) # Duty cycle of 7.2 is the gripper open pose

        while not rospy.is_shutdown():
            self.dynamixel_pub.publish(self.pos)
            pwm_servo.ChangeDutyCycle(self.gripperControl(self.SG90))
            self.current_joint_pub.publish(self.currentJointPos)
            rate.sleep()


if __name__ == "__main__":
    try:
        Servo_Controller()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass