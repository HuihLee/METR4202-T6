#!/usr/bin/env python
# servo_test.py - Test functionality of SG90 Micro Servo
#
# Written By: David Such

import RPi.GPIO as GPIO
import time

# Configure the Pi to use pin names (i.e. BCM) and allocate I/O
GPIO.setmode(GPIO.BCM)
GPIO.setup(13, GPIO.OUT)

#define open and closed duty cycles
openPose = 7.2
closedPose = 8.1


# Create PWM channel on the servo pin with a frequency of 50Hz
pwm_servo = GPIO.PWM(13, 50)
pwm_servo.start(openPose)

#def convertRadtoDutyCycle(rad):
    #duty_cycle = 4.5 * rad + 1
    #return duty_cycle

def closeGripper(rad):
    if rad < 1.57:
        duty_cycle = closedPose
    else:
        duty_cycle = openPose
    return duty_cycle

try:
    while True:
        #duty_cycle = convertRadtoDutyCycle(float(input("enter rad 0 - 2")))
        duty_cycle = closeGripper(float(input("enter rad value (will close under 1.57): ")))
        pwm_servo.ChangeDutyCycle(duty_cycle)
            
except KeyboardInterrupt:
    print("CTRL-C: Terminating program.")
finally:
    print("Cleaning up GPIO...")
    GPIO.cleanup()
