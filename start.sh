#!/bin/bash

Xvfb :1 -screen 0 1280x800x24 &
fluxbox &

websockify --web=/usr/share/novnc/ 6080 localhost:5901 &

source /opt/ros/humble/setup.bash

echo "ROS2 + Gazebo + GUI ready!"
sleep infinity
