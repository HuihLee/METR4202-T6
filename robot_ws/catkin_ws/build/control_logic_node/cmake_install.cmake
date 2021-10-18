# Install script for directory: /home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/michael/METR4202-T6/robot_ws/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/control_logic_node/msg" TYPE FILE FILES
    "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/ClawPose.msg"
    "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CubePose.msg"
    "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CurrentJointState.msg"
    "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesJointState.msg"
    "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointState.msg"
    "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointStateTrajectory.msg"
    "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TrajectoryComplete.msg"
    "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesPosition.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/control_logic_node/cmake" TYPE FILE FILES "/home/michael/METR4202-T6/robot_ws/catkin_ws/build/control_logic_node/catkin_generated/installspace/control_logic_node-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/michael/METR4202-T6/robot_ws/catkin_ws/devel/include/control_logic_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/michael/METR4202-T6/robot_ws/catkin_ws/devel/share/roseus/ros/control_logic_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/michael/METR4202-T6/robot_ws/catkin_ws/devel/share/common-lisp/ros/control_logic_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/michael/METR4202-T6/robot_ws/catkin_ws/devel/share/gennodejs/ros/control_logic_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/michael/METR4202-T6/robot_ws/catkin_ws/devel/lib/python3/dist-packages/control_logic_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/michael/METR4202-T6/robot_ws/catkin_ws/devel/lib/python3/dist-packages/control_logic_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/michael/METR4202-T6/robot_ws/catkin_ws/build/control_logic_node/catkin_generated/installspace/control_logic_node.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/control_logic_node/cmake" TYPE FILE FILES "/home/michael/METR4202-T6/robot_ws/catkin_ws/build/control_logic_node/catkin_generated/installspace/control_logic_node-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/control_logic_node/cmake" TYPE FILE FILES
    "/home/michael/METR4202-T6/robot_ws/catkin_ws/build/control_logic_node/catkin_generated/installspace/control_logic_nodeConfig.cmake"
    "/home/michael/METR4202-T6/robot_ws/catkin_ws/build/control_logic_node/catkin_generated/installspace/control_logic_nodeConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/control_logic_node" TYPE FILE FILES "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/michael/METR4202-T6/robot_ws/catkin_ws/build/control_logic_node/catkin_generated/installspace/control_logic_node.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/control_logic_node/cmake" TYPE FILE FILES "/home/michael/METR4202-T6/robot_ws/catkin_ws/build/control_logic_node/catkin_generated/installspace/control_logic_node-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/control_logic_node/cmake" TYPE FILE FILES
    "/home/michael/METR4202-T6/robot_ws/catkin_ws/build/control_logic_node/catkin_generated/installspace/control_logic_nodeConfig.cmake"
    "/home/michael/METR4202-T6/robot_ws/catkin_ws/build/control_logic_node/catkin_generated/installspace/control_logic_nodeConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/control_logic_node" TYPE FILE FILES "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/package.xml")
endif()

