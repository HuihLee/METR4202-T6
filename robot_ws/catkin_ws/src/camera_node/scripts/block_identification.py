#!/usr/bin/env python3

# All required imports
import rospy
from std_msgs.msg import String
from control_logic_node.msg import CubePose

from fiducial_msgs.msg import FiducialTransform, FiducialArray
from sensor_msgs.msg import Image
from vision_msgs.msg import Detection2D, Detection2DArray, ObjectHypothesisWithPose

import math

# Global variables used throughout code
ROBOT_FREQ = 100

cam_width = 1280
cam_height = 1024

RED =       0
GREEN =     1
BLUE =      2
YELLOW =    3
UNKNOWN =   4

MOVEMENT_THRESHOLD = 0.002

"""
Class used to operate camera and detect blocks and their colour.
Will publish the cubes x,y,z in the camera's frame and orientation in the z-axis
"""
class Camera:
    
    # Callback after fiducial has been detected
    def cd_fiducial(self, data):
        block = data.detections

        if len(block) > 0:  # check if data has valid information
        
            # get position
            x = block[0].results[0].pose.pose.position.x
            y = block[0].results[0].pose.pose.position.y
            z = block[0].results[0].pose.pose.position.z

            if self.check_block_still(x, y):    # check if the block is still moving 
                # get rotation
                x_quat = block[0].results[0].pose.pose.orientation.x
                y_quat = block[0].results[0].pose.pose.orientation.y
                z_quat = block[0].results[0].pose.pose.orientation.z
                w_quat = block[0].results[0].pose.pose.orientation.w

                t1 = 2.0 * (w_quat * z_quat + x_quat * y_quat)
                t2 = 1.0 - 2.0 * (y_quat * y_quat + z_quat * z_quat)
                yaw = abs(math.atan2(t1, t2))   # rotation in base z-axis
              
                angle = yaw# * 180/math.pi

                new_y = max(self.y0, self.y1, self.y2, self.y3)+20
                new_x = (self.x0 + self.x1 + self.x2 + self.x3)/4
                
                colour = self.get_colour(10, 10, new_x, new_y, self.image)
            
                # create message 
                message = CubePose()
                message.position[0] = x*1000
                message.position[1] = y*1000
                message.position[2] = z*1000
                message.position[3] = yaw            
                message.colour = colour
                
                if colour !="UNKNOWN":  # if the colour is unknown dont publish       
                    self.camera_pub.publish(message)
                   
    
    # determine if the block is moving or at stand still
    def check_block_still(self, x, y):
        # check absolute movement
        movement_x = abs(self.prev_x_pos - x)
        movement_y = abs(self.prev_y_pos - y)
        self.prev_x_pos = x
        self.prev_y_pos = y
        
        # if block is moving within threshold, block is 'still'
        if movement_x < MOVEMENT_THRESHOLD and movement_y < MOVEMENT_THRESHOLD:
            # block is still
            return True
        else:
            return False
    
    # Callback t0 get the points of found fiducial to determine colour
    def cb_colour(self, data):
        block = data.fiducials
        
        if len(block) > 0:  # check if data packet is valid
        
            self.x0 = round(block[0].x0)
            self.x1 = round(block[0].x1)
            self.x2 = round(block[0].x2)
            self.x3 = round(block[0].x3)
            self.y0 = round(block[0].y0)
            self.y1 = round(block[0].y1)
            self.y2 = round(block[0].y2)
            self.y3 = round(block[0].y3)

    # Save image to determine colour of pixel space if fiducial is found later
    def cb_image(self, data):
        self.image = data.data
        
    # Calculate the colour of roi
    def get_colour(self, width, height, x, y, image):

        X = x - (width / 2)
        Y = y + (height/2)
        
        # pixel space is not valid
        if X < 0 or Y < 0 or X+width > cam_width or Y-height < 0:
            rospy.logrr("Colour detection ROI out of bounds")

        ROI = []
        counter = 0
        R = 0 
        G = 0 
        B = 0
        # first pixel in ROI
        for column in range(int(Y), int(Y+height)):
            first_pixel_row = (Y - 1) * cam_width + X
            for pixel in range(int(first_pixel_row), int(first_pixel_row+width)):
                rgb_pixel = (pixel-1) * 3
                R = R + image[rgb_pixel + 2]
                G = G + image[rgb_pixel + 1]
                B = B + image[rgb_pixel]
        
        # calculate hue angle of roi
        R = R / (width*height)
        G = G / (width*height)
        B = B / (width*height)

        r = R/255
        g = G/255
        b = B/255

        max_val = max(r, g, b)
        min_val = min(r, g, b)
      
        if (r >= g and r >= b):
            hue = (g-b)/(max_val - min_val)
        elif (g >= b and g >= r):
            hue = 2.0 + (b-r)/(max_val - min_val)
        elif (b >= r and b >= g):
            hue = 4.0 + (r-g)/(max_val - min_val)
        else:
           rospy.logerr("Hue angle cannot be calculated")

        hue_angle = hue * 60.0

        if hue_angle < 0:
            hue_angle + 360
        elif hue_angle > 360:
            hue_angle - 360

        if (hue_angle < 15 or hue_angle > 345):
            return "RED"
        if (40 < hue_angle < 70):
            return "YELLOW"
        if (90 < hue_angle < 150):
            return "GREEN"
        if (180 < hue_angle < 255):
            return "BLUE"
        else:
            return "UNKNOWN"
    
    # Initialise camera_node
    def __init__(self):

        rospy.init_node('Camera', anonymous=False, log_level=rospy.DEBUG)
        rate = rospy.Rate(10)

        # Comms with rest of robot
        self.camera_pub = rospy.Publisher("Camera_Pose", CubePose, queue_size=10)

        # Comms with fiducials and ximea camera
        rospy.Subscriber("fiducial_transforms", Detection2DArray, self.cd_fiducial)
        rospy.Subscriber("fiducial_vertices", FiducialArray, self.cb_colour)
        rospy.Subscriber("/ximea_cam/image_raw", Image, self.cb_image)
           
        # init points of fiducial in pixel space
        self.x0 = None
        self.x1 = None
        self.x2 = None
        self.x3 = None
        self.y0 = None
        self.y1 = None
        self.y2 = None
        self.y3 = None
        
        # init values used to check if at stand still
        self.prev_x_pos = 0
        self.prev_y_pos =0

        self.image = None
        
        rospy.sleep(2)  # give system time to init everything

# Start camera_node
if __name__ == "__main__":
    try:
        Camera()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
