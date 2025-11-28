FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    sudo locales curl gnupg2 lsb-release software-properties-common \
    novnc websockify xvfb fluxbox x11-apps \
    wget apt-transport-https

# locale
RUN locale-gen en_US en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# ROS2 Humble install
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | apt-key add - \
 && sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2.list' \
 && apt update && apt install -y ros-humble-desktop-full

# TurtleBot3
RUN apt update && apt install -y ros-humble-turtlebot3*

ENV DISPLAY=:1
