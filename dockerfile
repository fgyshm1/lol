# Use a basic image with the necessary dependencies
FROM ubuntu:20.04

# Install required packages
RUN apt-get update && apt-get install -y \
    novnc \
    tightvncserver \
    xserver-xorg-video-dummy \
    xfce4 \
    x11vnc \
    && apt-get clean

# Set the working directory
WORKDIR /app

# Add your start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose ports
EXPOSE 5900 6080

# Run the start script
CMD ["/start.sh"]
