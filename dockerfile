FROM ubuntu:latest

# Install required packages
RUN apt update && apt install -y \
    x11vnc xvfb xfce4 xfce4-terminal tightvncserver \
    novnc websockify curl wget nano sudo

# Set up a user (to avoid running everything as root)
RUN useradd -m -s /bin/bash linuxuser && \
    echo "linuxuser:linux" | chpasswd && \
    adduser linuxuser sudo

# Set up VNC password (default: "linux")
RUN mkdir -p /home/linuxuser/.vnc && \
    echo "linux" | vncpasswd -f > /home/linuxuser/.vnc/passwd && \
    chmod 600 /home/linuxuser/.vnc/passwd

# Copy start script and set execute permissions
COPY start.sh /start.sh
RUN chmod +x /start.sh  # Ensure script is executable inside the container

# Expose noVNC port
EXPOSE 6080

# Run the start script
CMD ["/start.sh"]
