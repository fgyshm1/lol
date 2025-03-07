#!/bin/bash

# Start the Xfce desktop environment
startxfce4 &

# Start the VNC server
tightvncserver :1 -geometry 1280x720 -depth 24

# Start the noVNC web proxy (with SSL certificates if you have them)
mkdir -p /etc/ssl/novnc
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/novnc/novnc.key -out /etc/ssl/novnc/novnc.crt \
  -subj "/CN=localhost"

# Run noVNC to connect to the VNC server and serve the web interface on port 6080
/usr/share/novnc/utils/novnc_proxy --vnc localhost:5901 --cert=/etc/ssl/novnc/novnc.crt --key=/etc/ssl/novnc/novnc.key --web /usr/share/novnc/ --listen 6080
