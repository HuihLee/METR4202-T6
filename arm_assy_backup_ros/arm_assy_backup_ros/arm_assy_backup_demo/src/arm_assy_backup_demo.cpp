#include "ros/ros.h"
#include "std_msgs/Float64.h"

int main(int argc, char** argv) {
    ros::init(argc, argv, "arm_assy_backup_demo");
    ros::NodeHandle arm_assy_backup_nh;
    ros::Publisher theta1_pub = arm_assy_backup_nh.advertise<std_msgs::Float64>("/arm_assy_backup/theta1_position_controller/command", 1000);
    ros::Publisher theta2_pub = arm_assy_backup_nh.advertise<std_msgs::Float64>("/arm_assy_backup/theta2_position_controller/command", 1000);
    ros::Publisher theta3_pub = arm_assy_backup_nh.advertise<std_msgs::Float64>("/arm_assy_backup/theta3_position_controller/command", 1000);
    ros::Publisher theta4_pub = arm_assy_backup_nh.advertise<std_msgs::Float64>("/arm_assy_backup/theta4_position_controller/command", 1000);
    ros::Publisher thetaCarousel_pub = arm_assy_backup_nh.advertise<std_msgs::Float64>("/arm_assy_backup/thetaCarousel_position_controller/command", 1000);
    ros::Rate rate(100);
    int count = 0;
    while (ros::ok()) {
        std_msgs::Float64 msg1, msg2, msg3, msg4, msg5, msg6;
        msg1.data = ((double)(count % 1000) / 1000.0) * (2.0 * 3.14159265);
        msg2.data = (45.0 / 360.0) * (2.0 * 3.14159265);
        msg3.data = (-90.0 / 360.0) * (2.0 * 3.14159265);
        msg4.data = (0.0 / 360.0) * (2.0 * 3.14159265);
        msg5.data = (-45.0 / 360.0) * (2.0 * 3.14159265);
        msg6.data = ((double)count / 360.0) * (2.0 * 3.14159265);
        theta1_pub.publish(msg1);
        theta2_pub.publish(msg2);
        theta3_pub.publish(msg3);
        theta4_pub.publish(msg4);
        thetaCarousel_pub.publish(msg6);
        ros::spinOnce();
        rate.sleep();
        count++;
    }
    return 0;
}