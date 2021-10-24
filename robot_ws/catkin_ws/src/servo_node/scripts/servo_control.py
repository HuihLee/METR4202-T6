#!/usr/bin/env python3

# all required imports
import rospy
import RPi.GPIO as GPIO
import pigpio

import time

from std_msgs.msg import String
from control_logic_node.msg import CurrentJointState, DesJointState
from sensor_msgs.msg import JointState

# all global variables
ROBOT_FREQ = 10
up_threshold = 1.3
down_threshold = -0.6

SERVO_PIN = 13

"""
Class used to control dynamixel servos and SG90 servo. Subsribes/publishes to dynamixel interface and subscribes to trajectory node. Publishes current angle state for multiple nodes
"""
class Servo_Controller:

    # Desired joint states for all the servos
    def cb_desired_js(self, data):
        self.pos.position = [data.thetas[0], data.thetas[1], data.thetas[2], data.thetas[3]]
        self.pos.velocity = [0.50, 1.00, 1.00, 1.00]
        # Sets the position of the SG90 servo
        self.SG90 = data.thetas[4]

    # Current dynamixel joint states
    def cb_current_js(self, data):
        if data is not None:
            joint1 = data.position[3]
            joint2 = data.position[2]
            joint3 = data.position[1]
            joint4 = data.position[0]
            self.currentJointPos = [joint1, joint2, joint3, joint4, self.SG90]

    # Closes the gripper when the threshold pi/2 is passed
    def gripperControl(self, rad):
        if self.SG90 != self.prev_SG90:
            if rad < 1.57:
                self.duty_cycle = self.openPose
            else:
                self.duty_cycle = self.closePose
            self.prev_SG90 = self.SG90
            return True
        else:
            self.prev_SG90 = self.SG90
            return False

    # New code utilising pigpio to minimise SG90 twitching    
    def stop_pwm_twitching(self):
        if self.SG90 != self.prev_SG90: # change pose
            if self.SG90 > 1.57:       
                self.pwm.set_servo_pulsewidth(SERVO_PIN, self.openPose)
            else:
                self.pwm.set_servo_pulsewidth(SERVO_PIN, self.closePose)
            #self.pwm_servo.stop()
            
        self.prev_SG90 = self.SG90

    # Init Servo controller node
    def __init__(self):
        # init node
        GPIO.setwarnings(False)
        rospy.init_node('actuator_controller', anonymous=False, log_level=rospy.DEBUG)
        rate = rospy.Rate(10)

        # Comms with Dynamixels
        self.dynamixel_pub = rospy.Publisher("desired_joint_states", JointState, queue_size=10)
        rospy.Subscriber("joint_states", JointState, self.cb_current_js)

        # Comms with Trajectory Planner
        rospy.Subscriber("Trajectory_DesJS", DesJointState, self.cb_desired_js)
        
        # Comms with Control Logic and Forward Kinematics
        self.current_joint_pub = rospy.Publisher("Actuator_CurrentJS", CurrentJointState, queue_size=10)
        
        # define message for subscribing desired angle
        self.pos = JointState()
        self.pos.name = ["joint_1", "joint_2", "joint_3", "joint_4"]
        
        # Subscribe to dynamixel values
        self.currentJointPos = CurrentJointState()
        
        # Duty cycle to close the gripper
        self.closePose = 1700#8.1     #1620
        # Duty cycle to open the gripper
        self.openPose = 1440#7.2    #1440
        
        self.SG90 = 1
        self.prev_SG90 = 1
       
        # https://ben.akrin.com/?p=9158
        self.pwm = pigpio.pi() 
        self.pwm.set_mode(SERVO_PIN, pigpio.OUTPUT)
 
        self.pwm.set_PWM_frequency(SERVO_PIN, 50 )
        self.pwm.set_servo_pulsewidth(SERVO_PIN, self.openPose)
        
        while not rospy.is_shutdown():
            
            self.stop_pwm_twitching()

            self.dynamixel_pub.publish(self.pos)
            self.current_joint_pub.publish(self.currentJointPos)
            rate.sleep()
            
        # If ros shutdowns, stop pwm 
        self.pwm.set_PWM_dutycycle(SERVO_PIN, 0)
        self.pwm.set_PWM_frequency(SERVO_PIN, 0 )

# start servo controller node
if __name__ == "__main__":
    try:
        Servo_Controller()
    except rospy.ROSInterruptException:
        Servo_Controller.pwm.set_PWM_dutycycle(SERVO_PIN, 0)
        Servo_Controller.pwm.set_PWM_frequency(SERVO_PIN, 0 )
        pass
