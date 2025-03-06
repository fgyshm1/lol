#!/bin/bash

# Set display environment variable
export DISPLAY=:1

# Start Xfce session
tightvncserver :1 -geometry 1280x720 -depth 24

# Start noVNC (Web-based VNC viewer)
websockify --web=/usr/share/novnc/ --cert= --key= 6080 localhost:5901
