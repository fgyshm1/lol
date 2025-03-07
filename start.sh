#!/bin/bash

# Start Xfce and VNC
export DISPLAY=:1
tightvncserver :1 -geometry 1280x720 -depth 24

# Start noVNC
websockify --web=/usr/share/novnc/ --cert= --key= 6080 localhost:5901
