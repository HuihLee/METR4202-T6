# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ximea_ros_cam: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iximea_ros_cam:/home/michael/METR4202-T6/camera_ws/catkin_ws/src/ximea_ros_cam/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ximea_ros_cam_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/michael/METR4202-T6/camera_ws/catkin_ws/src/ximea_ros_cam/msg/XiImageInfo.msg" NAME_WE)
add_custom_target(_ximea_ros_cam_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ximea_ros_cam" "/home/michael/METR4202-T6/camera_ws/catkin_ws/src/ximea_ros_cam/msg/XiImageInfo.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ximea_ros_cam
  "/home/michael/METR4202-T6/camera_ws/catkin_ws/src/ximea_ros_cam/msg/XiImageInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ximea_ros_cam
)

### Generating Services

### Generating Module File
_generate_module_cpp(ximea_ros_cam
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ximea_ros_cam
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ximea_ros_cam_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ximea_ros_cam_generate_messages ximea_ros_cam_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/michael/METR4202-T6/camera_ws/catkin_ws/src/ximea_ros_cam/msg/XiImageInfo.msg" NAME_WE)
add_dependencies(ximea_ros_cam_generate_messages_cpp _ximea_ros_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ximea_ros_cam_gencpp)
add_dependencies(ximea_ros_cam_gencpp ximea_ros_cam_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ximea_ros_cam_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ximea_ros_cam
  "/home/michael/METR4202-T6/camera_ws/catkin_ws/src/ximea_ros_cam/msg/XiImageInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ximea_ros_cam
)

### Generating Services

### Generating Module File
_generate_module_eus(ximea_ros_cam
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ximea_ros_cam
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ximea_ros_cam_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ximea_ros_cam_generate_messages ximea_ros_cam_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/michael/METR4202-T6/camera_ws/catkin_ws/src/ximea_ros_cam/msg/XiImageInfo.msg" NAME_WE)
add_dependencies(ximea_ros_cam_generate_messages_eus _ximea_ros_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ximea_ros_cam_geneus)
add_dependencies(ximea_ros_cam_geneus ximea_ros_cam_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ximea_ros_cam_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ximea_ros_cam
  "/home/michael/METR4202-T6/camera_ws/catkin_ws/src/ximea_ros_cam/msg/XiImageInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ximea_ros_cam
)

### Generating Services

### Generating Module File
_generate_module_lisp(ximea_ros_cam
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ximea_ros_cam
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ximea_ros_cam_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ximea_ros_cam_generate_messages ximea_ros_cam_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/michael/METR4202-T6/camera_ws/catkin_ws/src/ximea_ros_cam/msg/XiImageInfo.msg" NAME_WE)
add_dependencies(ximea_ros_cam_generate_messages_lisp _ximea_ros_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ximea_ros_cam_genlisp)
add_dependencies(ximea_ros_cam_genlisp ximea_ros_cam_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ximea_ros_cam_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ximea_ros_cam
  "/home/michael/METR4202-T6/camera_ws/catkin_ws/src/ximea_ros_cam/msg/XiImageInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ximea_ros_cam
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ximea_ros_cam
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ximea_ros_cam
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ximea_ros_cam_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ximea_ros_cam_generate_messages ximea_ros_cam_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/michael/METR4202-T6/camera_ws/catkin_ws/src/ximea_ros_cam/msg/XiImageInfo.msg" NAME_WE)
add_dependencies(ximea_ros_cam_generate_messages_nodejs _ximea_ros_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ximea_ros_cam_gennodejs)
add_dependencies(ximea_ros_cam_gennodejs ximea_ros_cam_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ximea_ros_cam_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ximea_ros_cam
  "/home/michael/METR4202-T6/camera_ws/catkin_ws/src/ximea_ros_cam/msg/XiImageInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ximea_ros_cam
)

### Generating Services

### Generating Module File
_generate_module_py(ximea_ros_cam
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ximea_ros_cam
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ximea_ros_cam_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ximea_ros_cam_generate_messages ximea_ros_cam_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/michael/METR4202-T6/camera_ws/catkin_ws/src/ximea_ros_cam/msg/XiImageInfo.msg" NAME_WE)
add_dependencies(ximea_ros_cam_generate_messages_py _ximea_ros_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ximea_ros_cam_genpy)
add_dependencies(ximea_ros_cam_genpy ximea_ros_cam_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ximea_ros_cam_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ximea_ros_cam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ximea_ros_cam
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ximea_ros_cam_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ximea_ros_cam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ximea_ros_cam
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ximea_ros_cam_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ximea_ros_cam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ximea_ros_cam
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ximea_ros_cam_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ximea_ros_cam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ximea_ros_cam
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ximea_ros_cam_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ximea_ros_cam)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ximea_ros_cam\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ximea_ros_cam
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ximea_ros_cam_generate_messages_py std_msgs_generate_messages_py)
endif()
