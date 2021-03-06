FROM debian:buster-slim

LABEL authors https://www.oda-alexandre.com

ENV USER firefox
ENV HOME /home/${USER}

RUN echo -e '\033[36;1m ******* INSTALL APP ******** \033[0m' && \
  apt-get update && apt-get install -y --no-install-recommends \
  sudo \
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
  rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m' && \
  useradd -d ${HOME} -m ${USER} && \
  passwd -d ${USER} && \
  adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR ${HOME}

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD firefox \