# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "dynamixel_interface: 4 messages, 0 services")

set(MSG_I_FLAGS "-Idynamixel_interface:/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(dynamixel_interface_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg" NAME_WE)
add_custom_target(_dynamixel_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "dynamixel_interface" "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg" ""
)

get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPorts.msg" NAME_WE)
add_custom_target(_dynamixel_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "dynamixel_interface" "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPorts.msg" "std_msgs/Header:dynamixel_interface/DataPort"
)

get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg" NAME_WE)
add_custom_target(_dynamixel_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "dynamixel_interface" "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg" ""
)

get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiags.msg" NAME_WE)
add_custom_target(_dynamixel_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "dynamixel_interface" "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiags.msg" "std_msgs/Header:dynamixel_interface/ServoDiag"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_cpp(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPorts.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_cpp(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_cpp(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiags.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dynamixel_interface
)

### Generating Services

### Generating Module File
_generate_module_cpp(dynamixel_interface
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dynamixel_interface
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(dynamixel_interface_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(dynamixel_interface_generate_messages dynamixel_interface_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_cpp _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPorts.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_cpp _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_cpp _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiags.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_cpp _dynamixel_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dynamixel_interface_gencpp)
add_dependencies(dynamixel_interface_gencpp dynamixel_interface_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dynamixel_interface_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_eus(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPorts.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_eus(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_eus(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiags.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dynamixel_interface
)

### Generating Services

### Generating Module File
_generate_module_eus(dynamixel_interface
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dynamixel_interface
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(dynamixel_interface_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(dynamixel_interface_generate_messages dynamixel_interface_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_eus _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPorts.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_eus _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_eus _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiags.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_eus _dynamixel_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dynamixel_interface_geneus)
add_dependencies(dynamixel_interface_geneus dynamixel_interface_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dynamixel_interface_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_lisp(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPorts.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_lisp(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_lisp(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiags.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dynamixel_interface
)

### Generating Services

### Generating Module File
_generate_module_lisp(dynamixel_interface
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dynamixel_interface
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(dynamixel_interface_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(dynamixel_interface_generate_messages dynamixel_interface_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_lisp _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPorts.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_lisp _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_lisp _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiags.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_lisp _dynamixel_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dynamixel_interface_genlisp)
add_dependencies(dynamixel_interface_genlisp dynamixel_interface_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dynamixel_interface_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_nodejs(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPorts.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_nodejs(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_nodejs(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiags.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dynamixel_interface
)

### Generating Services

### Generating Module File
_generate_module_nodejs(dynamixel_interface
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dynamixel_interface
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(dynamixel_interface_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(dynamixel_interface_generate_messages dynamixel_interface_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_nodejs _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPorts.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_nodejs _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_nodejs _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiags.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_nodejs _dynamixel_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dynamixel_interface_gennodejs)
add_dependencies(dynamixel_interface_gennodejs dynamixel_interface_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dynamixel_interface_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_py(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPorts.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_py(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamixel_interface
)
_generate_msg_py(dynamixel_interface
  "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiags.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamixel_interface
)

### Generating Services

### Generating Module File
_generate_module_py(dynamixel_interface
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamixel_interface
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(dynamixel_interface_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(dynamixel_interface_generate_messages dynamixel_interface_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPort.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_py _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/DataPorts.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_py _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiag.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_py _dynamixel_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/metr4202/METR4202-T6/servo_ws/catkin_ws/src/dynamixel_interface/msg/ServoDiags.msg" NAME_WE)
add_dependencies(dynamixel_interface_generate_messages_py _dynamixel_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dynamixel_interface_genpy)
add_dependencies(dynamixel_interface_genpy dynamixel_interface_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dynamixel_interface_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dynamixel_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dynamixel_interface
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(dynamixel_interface_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(dynamixel_interface_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dynamixel_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dynamixel_interface
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(dynamixel_interface_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(dynamixel_interface_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dynamixel_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dynamixel_interface
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(dynamixel_interface_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(dynamixel_interface_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dynamixel_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dynamixel_interface
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(dynamixel_interface_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(dynamixel_interface_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamixel_interface)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamixel_interface\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamixel_interface
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(dynamixel_interface_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(dynamixel_interface_generate_messages_py sensor_msgs_generate_messages_py)
endif()
