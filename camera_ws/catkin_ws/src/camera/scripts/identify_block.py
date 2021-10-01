#!/usr/bin/env python3
# license removed for brevity

import rospy
from std_msgs.msg import String
from fiducial_msgs.msg import FiducialTransform
from vision_msgs.msg import Detection2DArray
from sensor_msgs.msg import Image

cam_width = 1280
cam_height = 1024


def callback(data):
    print("")

def compressed_image_callback(data):
    image = data.data
    
    detect_colour(1, 1, cam_width/2, cam_height/2, image)


def listener():
    # Initialise identifcation node
    rospy.init_node('identify_block', anonymous=False)
    # Initialise all subscribers
    rospy.Subscriber("fiducial_transforms", Detection2DArray, callback)
    rospy.Subscriber("/ximea_cam/image_raw", Image, compressed_image_callback)
    # Initialise all publishers
    
    # keep node running till exit message
    rospy.spin()


# def get_colour(values):
#     val = values
#     # if len(values) > 1:
#     #     val = 0
#     #     for i in values:
#     #         val = i + val
#     #     val = val/len(values)
#     # else:
#     #     val = values
    
#     R = val & 0xff
#     G = (val >> 8) & 0xff
#     B = (val >> 16) & 0xff

#     if (R > G & R > B):
#         print("red")
#     elif (B > R & B > G):
#         print("blue")
#     elif (G > R & G > B):
#         print("green")



# width -> ROI width
# height -> ROI height
# x -> mid point of ROI
# y -> mid point of ROI
def detect_colour(width, height, x, y, image):
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
    print(X, Y)
    for column in range(int(Y), int(Y+height)):
        first_pixel_row = (Y - 1) * cam_width + X
        for pixel in range(int(first_pixel_row), int(first_pixel_row+width)):
            rgb_pixel = (pixel-1) * 3
            R = R + image[rgb_pixel]
            G = G + image[rgb_pixel + 1]
            B = B + image[rgb_pixel + 2]
            # ROI[counter] = image[rgb_pixel]
            # ROI[counter] = image[rgb_pixel+1] << 8
            # ROI[counter] = image[rgb_pixel+2] << 16

    R = R / (width*height)
    G = G / (width*height)
    B = B / (width*height)

    print(R, G, B)

    # if (R > G and R > B):
    #     print("red!")
    # if (G > R and G > B):
    #     print("green!")
    # if (B > R and B > G):
    #     print("blue!")
    



if __name__ == "__main__":
    rospy.loginfo("Started Identifying Blocks...")
    listener()