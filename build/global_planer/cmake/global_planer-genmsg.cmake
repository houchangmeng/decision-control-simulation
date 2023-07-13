# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "global_planer: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Istyx_msgs:/home/ubuntu-1/yahboom/ROS/R2_simulation/src/styx_msgs/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(global_planer_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/global_planer/srv/Nav.srv" NAME_WE)
add_custom_target(_global_planer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "global_planer" "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/global_planer/srv/Nav.srv" "geometry_msgs/TwistStamped:geometry_msgs/Twist:std_msgs/Header:geometry_msgs/Pose:geometry_msgs/PoseStamped:geometry_msgs/Vector3:geometry_msgs/Point:geometry_msgs/Quaternion"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(global_planer
  "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/global_planer/srv/Nav.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/global_planer
)

### Generating Module File
_generate_module_cpp(global_planer
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/global_planer
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(global_planer_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(global_planer_generate_messages global_planer_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/global_planer/srv/Nav.srv" NAME_WE)
add_dependencies(global_planer_generate_messages_cpp _global_planer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(global_planer_gencpp)
add_dependencies(global_planer_gencpp global_planer_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS global_planer_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(global_planer
  "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/global_planer/srv/Nav.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/global_planer
)

### Generating Module File
_generate_module_eus(global_planer
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/global_planer
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(global_planer_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(global_planer_generate_messages global_planer_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/global_planer/srv/Nav.srv" NAME_WE)
add_dependencies(global_planer_generate_messages_eus _global_planer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(global_planer_geneus)
add_dependencies(global_planer_geneus global_planer_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS global_planer_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(global_planer
  "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/global_planer/srv/Nav.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/global_planer
)

### Generating Module File
_generate_module_lisp(global_planer
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/global_planer
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(global_planer_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(global_planer_generate_messages global_planer_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/global_planer/srv/Nav.srv" NAME_WE)
add_dependencies(global_planer_generate_messages_lisp _global_planer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(global_planer_genlisp)
add_dependencies(global_planer_genlisp global_planer_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS global_planer_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(global_planer
  "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/global_planer/srv/Nav.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/global_planer
)

### Generating Module File
_generate_module_nodejs(global_planer
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/global_planer
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(global_planer_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(global_planer_generate_messages global_planer_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/global_planer/srv/Nav.srv" NAME_WE)
add_dependencies(global_planer_generate_messages_nodejs _global_planer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(global_planer_gennodejs)
add_dependencies(global_planer_gennodejs global_planer_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS global_planer_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(global_planer
  "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/global_planer/srv/Nav.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/global_planer
)

### Generating Module File
_generate_module_py(global_planer
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/global_planer
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(global_planer_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(global_planer_generate_messages global_planer_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/global_planer/srv/Nav.srv" NAME_WE)
add_dependencies(global_planer_generate_messages_py _global_planer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(global_planer_genpy)
add_dependencies(global_planer_genpy global_planer_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS global_planer_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/global_planer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/global_planer
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(global_planer_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET styx_msgs_generate_messages_cpp)
  add_dependencies(global_planer_generate_messages_cpp styx_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/global_planer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/global_planer
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(global_planer_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET styx_msgs_generate_messages_eus)
  add_dependencies(global_planer_generate_messages_eus styx_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/global_planer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/global_planer
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(global_planer_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET styx_msgs_generate_messages_lisp)
  add_dependencies(global_planer_generate_messages_lisp styx_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/global_planer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/global_planer
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(global_planer_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET styx_msgs_generate_messages_nodejs)
  add_dependencies(global_planer_generate_messages_nodejs styx_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/global_planer)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/global_planer\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/global_planer
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(global_planer_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET styx_msgs_generate_messages_py)
  add_dependencies(global_planer_generate_messages_py styx_msgs_generate_messages_py)
endif()
