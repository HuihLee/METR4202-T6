execute_process(COMMAND "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/build/DynamixelSDK/ros/dynamixel_sdk/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/metr4202/METR4202-T6/servo_ws/catkin_ws/build/DynamixelSDK/ros/dynamixel_sdk/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
