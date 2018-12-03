FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

RUN apt-get update && apt-get install -y --no-install-recommends \
sudo \
firefox-esr \
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
mesa-utils

RUN useradd -d /home/firefox -m firefox && \
passwd -d firefox && \
adduser firefox sudo

RUN apt-get --purge autoremove -y

USER firefox

RUN sudo apt-get --purge autoremove -y && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

CMD firefox
