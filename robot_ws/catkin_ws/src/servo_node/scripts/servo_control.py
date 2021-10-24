#!/usr/bin/env python3
import rospy
import RPi.GPIO as GPIO
import pigpio

import time

from std_msgs.msg import String
from control_logic_node.msg import CurrentJointState, DesJointState
from sensor_msgs.msg import JointState

ROBOT_FREQ = 10
up_threshold = 1.3
down_threshold = -0.6

SERVO_PIN = 13

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


    def test(self):
        print("in test\n")
        self.testPos.name = ["joint_1", "joint_2","joint_3", "joint_4"]
         
        self.testPos.position = [0.000, 0.500, 0.5, self.head_value]
        if self.head_value == 1.3:
            self.up = False
        if self.head_value == -0.7:
            self.up = True

        if self.up is True:
            self.head_value = self.head_value + 0.1
        else:
            self.head_value = self.head_value - 0.1
       # Sets the position of the SG90 servo
        #self.testSG90 = 1pwm.set_PWM_dutycycle(servo, 0)

        print("end of test\n")
        
    def stop_pwm_twitching(self):
        if self.SG90 != self.prev_SG90: # change pose
            if self.SG90 > 1.57:       
                self.pwm.set_servo_pulsewidth(SERVO_PIN, self.openPose)
            else:
                self.pwm.set_servo_pulsewidth(SERVO_PIN, self.closePose)
            #self.pwm_servo.stop()
            
        self.prev_SG90 = self.SG90


    def __init__(self):
        GPIO.setwarnings(False)
        rospy.init_node('actuator_controller', anonymous=False, log_level=rospy.DEBUG)
        rate = rospy.Rate(10)

        self.pos = JointState()
        self.pos.name = ["joint_1", "joint_2", "joint_3", "joint_4"]

        self.testPos = JointState()
        self.currentJointPos = CurrentJointState()

        # Comms with Dynamixels
        self.dynamixel_pub = rospy.Publisher("desired_joint_states", JointState, queue_size=10)
        rospy.Subscriber("joint_states", JointState, self.cb_current_js)

        # Comms with Trajectory Planner
        rospy.Subscriber("Trajectory_DesJS", DesJointState, self.cb_desired_js)
        
        # Comms with Control Logic and Forward Kinematics
        self.current_joint_pub = rospy.Publisher("Actuator_CurrentJS", CurrentJointState, queue_size=10)

        # Duty cycle to close the gripper
        self.closePose = 1700#8.1     #1620
        # Duty cycle to open the gripper
        self.openPose = 1440#7.2    #1440
        
        
        self.SG90 = 1
        self.prev_SG90 = 1
        """
        # Configure the Pi to use pin names (i.e. BCM) and allocate I/O
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(13, GPIO.OUT)

        # Create PWM channel on pin 13 with a frequency of 50Hz
        self.pwm_servo = GPIO.PWM(13, 50)
        self.pwm_servo.start(self.openPose) # Duty cycle of 7.2 is the gripper open pose
        #self.pwm_servo.stop()
        """
        # https://ben.akrin.com/?p=9158
        self.pwm = pigpio.pi() 
        self.pwm.set_mode(SERVO_PIN, pigpio.OUTPUT)
 
        self.pwm.set_PWM_frequency(SERVO_PIN, 50 )
        self.pwm.set_servo_pulsewidth(SERVO_PIN, self.openPose)
        
        while not rospy.is_shutdown():
            #if self.gripperControl(self.SG90)==self.closePose:
            #    pwm_servo.ChangeDutyCycle(self.closePose)
            #if self.gripperControl(self.SG90) == True:
            #    pwm_servo.ChangeDutyCycle(self.SG90)
            #    rospy.loginfo("changing duty cycle")
            self.stop_pwm_twitching()

            self.dynamixel_pub.publish(self.pos)
            self.current_joint_pub.publish(self.currentJointPos)
            rate.sleep()
            
            
        self.pwm.set_PWM_dutycycle(SERVO_PIN, 0)
        self.pwm.set_PWM_frequency(SERVO_PIN, 0 )

if __name__ == "__main__":
    try:
        Servo_Controller()
        #rospy.spin()
    except rospy.ROSInterruptException:
        #GPIO.cleanup()
        Servo_Controller.pwm.set_PWM_dutycycle(SERVO_PIN, 0)
        Servo_Controller.pwm.set_PWM_frequency(SERVO_PIN, 0 )
        pass
