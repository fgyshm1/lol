# Use a base image with Ubuntu (or Debian) as the base
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages (VNC, Xfce, noVNC, OpenSSL, etc.)
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    tightvncserver \
    xfce4 \
    x11vnc \
    novnc \
    websockify \
    openssl \
    curl \
    && apt-get clean

# Set working directory
WORKDIR /app

# Copy start.sh into the container and give it execution permissions
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose the necessary ports
EXPOSE 6080

# Command to run the start.sh script
CMD ["/start.sh"]
