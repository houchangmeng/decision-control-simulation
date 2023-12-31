# Install script for directory: /home/ubuntu-1/yahboom/ROS/R2_simulation/src/styx_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ubuntu-1/yahboom/ROS/R2_simulation/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
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

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/styx_msgs/msg" TYPE FILE FILES
    "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/styx_msgs/msg/TrafficLight.msg"
    "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/styx_msgs/msg/TrafficLightArray.msg"
    "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/styx_msgs/msg/Waypoint.msg"
    "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/styx_msgs/msg/Lane.msg"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/styx_msgs/srv" TYPE FILE FILES "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/styx_msgs/srv/Nav.srv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/styx_msgs/cmake" TYPE FILE FILES "/home/ubuntu-1/yahboom/ROS/R2_simulation/build/styx_msgs/catkin_generated/installspace/styx_msgs-msg-paths.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ubuntu-1/yahboom/ROS/R2_simulation/devel/include/styx_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/ubuntu-1/yahboom/ROS/R2_simulation/devel/share/roseus/ros/styx_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/ubuntu-1/yahboom/ROS/R2_simulation/devel/share/common-lisp/ros/styx_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/ubuntu-1/yahboom/ROS/R2_simulation/devel/share/gennodejs/ros/styx_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/ubuntu-1/yahboom/ROS/R2_simulation/devel/lib/python3/dist-packages/styx_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/ubuntu-1/yahboom/ROS/R2_simulation/devel/lib/python3/dist-packages/styx_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ubuntu-1/yahboom/ROS/R2_simulation/build/styx_msgs/catkin_generated/installspace/styx_msgs.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/styx_msgs/cmake" TYPE FILE FILES "/home/ubuntu-1/yahboom/ROS/R2_simulation/build/styx_msgs/catkin_generated/installspace/styx_msgs-msg-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/styx_msgs/cmake" TYPE FILE FILES
    "/home/ubuntu-1/yahboom/ROS/R2_simulation/build/styx_msgs/catkin_generated/installspace/styx_msgsConfig.cmake"
    "/home/ubuntu-1/yahboom/ROS/R2_simulation/build/styx_msgs/catkin_generated/installspace/styx_msgsConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/styx_msgs" TYPE FILE FILES "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/styx_msgs/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ubuntu-1/yahboom/ROS/R2_simulation/build/styx_msgs/catkin_generated/installspace/styx_msgs.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/styx_msgs/cmake" TYPE FILE FILES "/home/ubuntu-1/yahboom/ROS/R2_simulation/build/styx_msgs/catkin_generated/installspace/styx_msgs-msg-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/styx_msgs/cmake" TYPE FILE FILES
    "/home/ubuntu-1/yahboom/ROS/R2_simulation/build/styx_msgs/catkin_generated/installspace/styx_msgsConfig.cmake"
    "/home/ubuntu-1/yahboom/ROS/R2_simulation/build/styx_msgs/catkin_generated/installspace/styx_msgsConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/styx_msgs" TYPE FILE FILES "/home/ubuntu-1/yahboom/ROS/R2_simulation/src/styx_msgs/package.xml")
endif()

