#!/bin/bash

# Set the user environment variable
export USER=root

# Install dependencies if needed
apt-get update && apt-get install -y novnc xserver-xorg-video-dummy xfce4 tightvncserver

# Start Xvfb (Virtual X server) with a virtual display
Xvfb :0 -screen 0 1024x768x16 &

# Start the VNC server
tightvncserver :0

# Start NoVNC (web-based VNC)
export DISPLAY=:0
/usr/share/novnc/utils/novnc_proxy --vnc localhost:5900 --listen 6080
