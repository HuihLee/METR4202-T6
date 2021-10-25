# Robot workspace
## File Description for Final METR4202 Robot
The purpose of this robot is to correctly identify and locate a block using fiducials and accurately move a robotic arm over and grab the block. Next the robot must move the block to the correct bin behind and start the entire process again. Whilst this is happening, the blocks will be spinning on a carousel. 

## Structure
<pre>
--> catkin_ws <br/>
    --> src <br/>
        --> Python (modern_robotics library) <br/>
        --> camera_node <br/>
            --> config <br/>
            --> launch <br/>
            --> scripts <br/>
        --> control_logic_node <br/>
            --> launch <br/>
            --> msg <br/>
            --> scripts <br/>
        --> forward_kinematics_node <br/>
            --> scripts <br/>
        --> inverse_kinematics_node <br/>
            --> scripts <br/>
        --> servo_node <br/>
            --> config <br/>
            --> launch <br/>
            --> scripts <br/>
        --> trajectory_node <br/>
            --> launch <br/>
            --> scripts <br/>
</pre>

## Current setup and installation steps to use robot:
1. Clone repo
'''
git clone 
'''
2. Clone all needed packages
'''
git clone https://github.com/UbiquityRobotics/fiducials.git
git clone https://github.com/wavelab/ximea_ros_cam.git
git clone https://github.com/csiro-robotics/dynamixel_interface.git
'''     
3. Install Dynamixel SDK
'''
sudo apt-get install ros-noetic-dynamixel-sdk
'''
4. Run in root terminal to use Rpi
'''
sudo chown root.gpio /dev/gpiomem
sudo chmod g+rw /dev/gpiomem
'''
5. Run to use Ximea Camera
'''
sudo tee /sys/module/usbcore/parameters/usbfs_memory_mb >/dev/null <<<0
'''
6. Install modern robotics
'''
pip install modern_robotics
'''
7. Run to use servo (pigio - https://abyz.me.uk/rpi/pigpio/download.html)
'''
wget https://github.com/joan2937/pigpio/archive/master.zip
unzip master.zip
cd pigpio-master
make
sudo make install
sudo pigiod
'''
8. After all installations and variables set, start robot
'''
cd ~/METR4202-T6/robot_ws/catkin_ws/
catkin_make
source /devel/setup.bash
roslaunch control_logic_node logic.launch
'''

After completing the above steps, the robot should be picking and depositing blocks :).
