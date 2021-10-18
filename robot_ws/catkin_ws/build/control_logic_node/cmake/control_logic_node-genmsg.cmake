# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "control_logic_node: 8 messages, 0 services")

set(MSG_I_FLAGS "-Icontrol_logic_node:/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(control_logic_node_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/ClawPose.msg" NAME_WE)
add_custom_target(_control_logic_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_logic_node" "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/ClawPose.msg" ""
)

get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CubePose.msg" NAME_WE)
add_custom_target(_control_logic_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_logic_node" "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CubePose.msg" ""
)

get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CurrentJointState.msg" NAME_WE)
add_custom_target(_control_logic_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_logic_node" "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CurrentJointState.msg" ""
)

get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesJointState.msg" NAME_WE)
add_custom_target(_control_logic_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_logic_node" "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesJointState.msg" ""
)

get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointState.msg" NAME_WE)
add_custom_target(_control_logic_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_logic_node" "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointState.msg" ""
)

get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointStateTrajectory.msg" NAME_WE)
add_custom_target(_control_logic_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_logic_node" "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointStateTrajectory.msg" ""
)

get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TrajectoryComplete.msg" NAME_WE)
add_custom_target(_control_logic_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_logic_node" "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TrajectoryComplete.msg" ""
)

get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesPosition.msg" NAME_WE)
add_custom_target(_control_logic_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_logic_node" "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesPosition.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/ClawPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_logic_node
)
_generate_msg_cpp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CubePose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_logic_node
)
_generate_msg_cpp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CurrentJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_logic_node
)
_generate_msg_cpp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_logic_node
)
_generate_msg_cpp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_logic_node
)
_generate_msg_cpp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_logic_node
)
_generate_msg_cpp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TrajectoryComplete.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_logic_node
)
_generate_msg_cpp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_logic_node
)

### Generating Services

### Generating Module File
_generate_module_cpp(control_logic_node
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_logic_node
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(control_logic_node_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(control_logic_node_generate_messages control_logic_node_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/ClawPose.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_cpp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CubePose.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_cpp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CurrentJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_cpp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_cpp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_cpp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointStateTrajectory.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_cpp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TrajectoryComplete.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_cpp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesPosition.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_cpp _control_logic_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_logic_node_gencpp)
add_dependencies(control_logic_node_gencpp control_logic_node_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_logic_node_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/ClawPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_logic_node
)
_generate_msg_eus(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CubePose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_logic_node
)
_generate_msg_eus(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CurrentJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_logic_node
)
_generate_msg_eus(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_logic_node
)
_generate_msg_eus(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_logic_node
)
_generate_msg_eus(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_logic_node
)
_generate_msg_eus(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TrajectoryComplete.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_logic_node
)
_generate_msg_eus(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_logic_node
)

### Generating Services

### Generating Module File
_generate_module_eus(control_logic_node
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_logic_node
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(control_logic_node_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(control_logic_node_generate_messages control_logic_node_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/ClawPose.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_eus _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CubePose.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_eus _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CurrentJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_eus _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_eus _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_eus _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointStateTrajectory.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_eus _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TrajectoryComplete.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_eus _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesPosition.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_eus _control_logic_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_logic_node_geneus)
add_dependencies(control_logic_node_geneus control_logic_node_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_logic_node_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/ClawPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_logic_node
)
_generate_msg_lisp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CubePose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_logic_node
)
_generate_msg_lisp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CurrentJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_logic_node
)
_generate_msg_lisp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_logic_node
)
_generate_msg_lisp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_logic_node
)
_generate_msg_lisp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_logic_node
)
_generate_msg_lisp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TrajectoryComplete.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_logic_node
)
_generate_msg_lisp(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_logic_node
)

### Generating Services

### Generating Module File
_generate_module_lisp(control_logic_node
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_logic_node
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(control_logic_node_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(control_logic_node_generate_messages control_logic_node_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/ClawPose.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_lisp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CubePose.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_lisp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CurrentJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_lisp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_lisp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_lisp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointStateTrajectory.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_lisp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TrajectoryComplete.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_lisp _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesPosition.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_lisp _control_logic_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_logic_node_genlisp)
add_dependencies(control_logic_node_genlisp control_logic_node_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_logic_node_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/ClawPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_logic_node
)
_generate_msg_nodejs(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CubePose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_logic_node
)
_generate_msg_nodejs(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CurrentJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_logic_node
)
_generate_msg_nodejs(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_logic_node
)
_generate_msg_nodejs(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_logic_node
)
_generate_msg_nodejs(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_logic_node
)
_generate_msg_nodejs(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TrajectoryComplete.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_logic_node
)
_generate_msg_nodejs(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_logic_node
)

### Generating Services

### Generating Module File
_generate_module_nodejs(control_logic_node
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_logic_node
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(control_logic_node_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(control_logic_node_generate_messages control_logic_node_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/ClawPose.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_nodejs _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CubePose.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_nodejs _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CurrentJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_nodejs _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_nodejs _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_nodejs _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointStateTrajectory.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_nodejs _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TrajectoryComplete.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_nodejs _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesPosition.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_nodejs _control_logic_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_logic_node_gennodejs)
add_dependencies(control_logic_node_gennodejs control_logic_node_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_logic_node_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/ClawPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_logic_node
)
_generate_msg_py(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CubePose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_logic_node
)
_generate_msg_py(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CurrentJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_logic_node
)
_generate_msg_py(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_logic_node
)
_generate_msg_py(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_logic_node
)
_generate_msg_py(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_logic_node
)
_generate_msg_py(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TrajectoryComplete.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_logic_node
)
_generate_msg_py(control_logic_node
  "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_logic_node
)

### Generating Services

### Generating Module File
_generate_module_py(control_logic_node
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_logic_node
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(control_logic_node_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(control_logic_node_generate_messages control_logic_node_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/ClawPose.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_py _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CubePose.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_py _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/CurrentJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_py _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_py _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointState.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_py _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TargetJointStateTrajectory.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_py _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/TrajectoryComplete.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_py _control_logic_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/michael/METR4202-T6/robot_ws/catkin_ws/src/control_logic_node/msg/DesPosition.msg" NAME_WE)
add_dependencies(control_logic_node_generate_messages_py _control_logic_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_logic_node_genpy)
add_dependencies(control_logic_node_genpy control_logic_node_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_logic_node_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_logic_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_logic_node
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(control_logic_node_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_logic_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_logic_node
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(control_logic_node_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_logic_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_logic_node
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(control_logic_node_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_logic_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_logic_node
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(control_logic_node_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_logic_node)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_logic_node\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_logic_node
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(control_logic_node_generate_messages_py std_msgs_generate_messages_py)
endif()
