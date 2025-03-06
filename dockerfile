# Use Ubuntu as the base image
FROM ubuntu:latest

# Install necessary packages
RUN apt update && apt install -y \
    x11vnc xvfb xfce4 xfce4-terminal tightvncserver novnc websockify curl wget nano sudo

# Create a user to avoid running as root
RUN useradd -m -s /bin/bash linuxuser && \
    echo "linuxuser:linux" | chpasswd && \
    adduser linuxuser sudo

# Set up a VNC password
RUN mkdir -p /home/linuxuser/.vnc && \
    echo "linux" | vncpasswd -f > /home/linuxuser/.vnc/passwd && \
    chmod 600 /home/linuxuser/.vnc/passwd && \
    chown -R linuxuser:linuxuser /home/linuxuser/.vnc

# Copy the startup script into the container
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose the noVNC port
EXPOSE 6080

# Run the startup script when the container starts
CMD ["/start.sh"]
