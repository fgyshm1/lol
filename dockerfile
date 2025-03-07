# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set non-interactive mode for tzdata
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages, including tzdata
RUN apt-get update && \
    apt-get install -y \
    tzdata \
    && ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get install -y \
    libwayland-server0 \
    libx11-xcb1 \
    libpciaccess0 \
    mysql-common \
    libmysqlclient21 \
    libraw1394-11 \
    libkeyutils1 \
    libsbc1 \
    libproxy1v5 \
    pci.ids \
    libpsl5 \
    libsodium23 \
    libgpm2 \
    libmpg123-0 \
    libogg0 \
    xfdesktop4-data \
    perl-modules-5.30 \
    mime-support \
    libspeex1 \
    liblouisutdml-data \
    fonts-noto-mono \
    wget \
    libplist3 \
    hicolor-icon-theme \
    libtwolame0 \
    libvte-2.91-common \
    cups-server-common \
    libhyphen0 \
    libdatrie1 \
    libfontembed1 \
    xdg-user-dirs \
    libexo-common \
    mobile-broadband-provider-info \
    alsa-ucm-conf \
    libmagic-mgc \
    ubuntu-wallpapers-focal \
    yaru-theme-gnome-shell \
    libvisual-0.4-0 \
    psmisc \
    libyaml-0-2 \
    libip6tc2 \
    libglib2.0-0 \
    libaspell15 \
    distro-info-data \
    libglvnd0 \
    libwnck-3-common \
    libsnmp-base \
    libtdb1 \
    libmaxminddb0 \
    fonts-ubuntu \
    tumbler-common \
    libijs-0.35 \
    cups-common \
    unzip \
    libdbusmenu-glib4 \
    libbrotli1 \
    wireless-regdb \
    libsqlite3-0 \
    libsasl2-modules \
    libxfce4util-common \
    libgdk-pixbuf2.0-common \
    dosfstools \
    libibus-1.0-5 \
    libgdata-common \
    x11-common \
    libmagic1 \
    libwebrtc-audio-processing1 \
    gettext-base \
    libcdio18 \
    libpackagekit-glib2-18 \
    libnss-systemd \
    liblzo2-2 \
    libntfs-3g883 \
    libfcitx-utils0 \
    libnpth0 \
    krb5-locales \
    libwhoopsie0 \
    file \
    libbamf3-2 \
    fonts-urw-base35 \
    libnfs13 \
    kmod \
    libassuan0 \
    libgomp1 \
    gir1.2-gdesktopenums-3.0 \
    libldap-common \
    libunwind8 \
    libgphoto2-l10n \
    apport-symptoms \
    libjbig0 \
    libcolord2 \
    ntfs-3g \
    libopengl0 \
    colord-data \
    python-babel-localedata \
    libjansson4 \
    libflac8 \
    poppler-data \
    libgarcon-common \
    acl \
    libkrb5support0 \
    dns-root-data \
    libsasl2-modules-db \
    tzdata && \
    rm -rf /var/lib/apt/lists/*

# Set the time zone to New York
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

# Set the working directory
WORKDIR /app

# Copy your application code into the container (adjust the path)
COPY . /app

# Expose any ports your application uses (adjust the port number as necessary)
EXPOSE 8080

# Set the default command to run your application (adjust as needed)
CMD ["your_start_command"]
