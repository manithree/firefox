# IMAGE TO USE
FROM debian:stretch-slim

# MAINTAINER
MAINTAINER https://www.oda-alexandre.com/

# VARIABLES
ENV USER firefox
ENV LANG fr_FR.UTF-8

# INSTALL APP
RUN apt-get update && apt-get install -y --no-install-recommends \
sudo \
locales \
firefox-esr \
firefox-esr-l10n-fr \
desktop-file-utils \
adwaita-icon-theme \
ttf-dejavu \
ffmpeg \
ca-certificates \
gnupg \
apt-transport-https \
x11-xserver-utils \
dirmngr \
gnupg-l10n \
alsa-utils \
libasound2 \
libasound2-plugins \
pulseaudio \
pulseaudio-utils \
libcanberra-gtk-module \
libcanberra-gtk3-module \
libgl1-mesa-dri \
libgl1-mesa-glx \
mesa-utils && \

# CHANGE LOCALES
echo ${LANG} > /etc/locale.gen && locale-gen && \

# ADD USER
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECT USER
USER ${USER}

# SELECT WORKING SPACE
WORKDIR /home/${USER}

# CLEANING
RUN sudo apt-get --purge autoremove -y && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# START THE CONTAINER
CMD firefox \
