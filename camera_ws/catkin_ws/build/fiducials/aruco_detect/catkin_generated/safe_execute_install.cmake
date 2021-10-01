execute_process(COMMAND "/home/michael/METR4202-T6/camera_ws/catkin_ws/build/fiducials/aruco_detect/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/michael/METR4202-T6/camera_ws/catkin_ws/build/fiducials/aruco_detect/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
