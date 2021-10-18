#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
from control_logic_node.msg import CubePose

from fiducial_msgs.msg import FiducialTransform, FiducialArray
from sensor_msgs.msg import Image
from vision_msgs.msg import Detection2D, Detection2DArray, ObjectHypothesisWithPose

import math

ROBOT_FREQ = 10

cam_width = 1280
cam_height = 1024

RED =       0
GREEN =     1
BLUE =      2
YELLOW =    3
UNKNOWN =   4

class Camera:

    def cd_fiducial(self, data):
        block = data.detections

        if len(block) > 0:
            try:
                # get position
                x = block[0].results[0].pose.pose.position.x
                y = block[0].results[0].pose.pose.position.y
                z = block[0].results[0].pose.pose.position.z

                # get rotation
                x_quat = block[0].results[0].pose.pose.orientation.x
                y_quat = block[0].results[0].pose.pose.orientation.y
                z_quat = block[0].results[0].pose.pose.orientation.z
                w_quat = block[0].results[0].pose.pose.orientation.w

                t1 = 2.0 * (w_quat * z_quat + x_quat * y_quat)
                t2 = 1.0 - 2.0 * (y_quat * y_quat + z_quat * z_quat)
                yaw = abs(math.atan2(t1, t2))
                
                if yaw > math.pi:
                    yaw = yaw - math.pi

                if yaw > math.pi/2:
                    yaw = yaw - math.pi/2
                
                angle = yaw * 180/math.pi

                # get colour

                # width = self.x3 - self.x2
                # height = 10
                # roi_x = (self.x2+self.x3)/2
                # if self.y2 > self.y3:
                #     roi_y = self.y2+10
                # else:
                #     roi_y = self.y3+10
                # print("new box")
                # print(self.x0, self.y0)
                # print(self.x1, self.y1)
                # print(self.x2, self.y2)
                # print(self.x3, self.y3)
                # print("\n")

                new_y = max(self.y0, self.y1, self.y2, self.y3)+20
                new_x = (self.x0 + self.x1 + self.x2 + self.x3)/4
                # roi_y = (self.y2+self.y3)/2 + 15
                

                colour = self.get_colour(10, 10, new_x, new_y, self.image)
              
                # create message 
                message = CubePose()
                message.position[0] = x
                message.position[1] = y
                message.position[2] = z
                message.position[3] = yaw            
                message.colour = colour

                print(colour)
            except:
                pass
            # print(x, y, z, yaw)
            self.camera_pub.publish(message)

    def cb_colour(self, data):
        block = data.fiducials
        if len(block) > 0:
        # print(data)
            self.x0 = round(block[0].x0)
            self.x1 = round(block[0].x1)
            self.x2 = round(block[0].x2)
            self.x3 = round(block[0].x3)
            self.y0 = round(block[0].y0)
            self.y1 = round(block[0].y1)
            self.y2 = round(block[0].y2)
            self.y3 = round(block[0].y3)


    def cb_image(self, data):
        self.image = data.data
        # rospy.sleep()
        

    def get_colour(self, width, height, x, y, image):

        X = x - (width / 2)
        Y = y + (height/2)

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

        R = R / (width*height)
        G = G / (width*height)
        B = B / (width*height)

        r = R/255
        g = G/255
        b = B/255

        max_val = max(r, g, b)
        min_val = min(r, g, b)
        # if (max_val - min_val < 2):
        #     print("bright light?")
        #     return None

        if (r >= g and r >= b):
            hue = (g-b)/(max_val - min_val)
        elif (g >= b and g >= r):
            hue = 2.0 + (b-r)/(max_val - min_val)
        elif (b >= r and b >= g):
            hue = 4.0 + (r-g)/(max_val - min_val)
        else:
            print("how")

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

    def __init__(self):

        rospy.init_node('Camera', anonymous=False)
        rate = rospy.Rate(ROBOT_FREQ)

        # Comms with rest of robot
        self.camera_pub = rospy.Publisher("Camera_Pose", CubePose, queue_size=10)

        # Comms with fiducials and ximea camera
        rospy.Subscriber("fiducial_transforms", Detection2DArray, self.cd_fiducial)
        rospy.Subscriber("fiducial_vertices", FiducialArray, self.cb_colour)
        rospy.Subscriber("/ximea_cam/image_raw", Image, self.cb_image)
        
        self.x0 = None
        self.x1 = None
        self.x2 = None
        self.x3 = None
        self.y0 = None
        self.y1 = None
        self.y2 = None
        self.y3 = None

        self.image = None


if __name__ == "__main__":
    try:
        Camera()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass