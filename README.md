# FIREFOX

![logo](https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904445/Firefox-Logo-1.jpg)

## INDEX

- [FIREFOX](#firefox)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
    - [DOCKER RUN](#docker-run)
    - [DOCKER COMPOSE](#docker-compose)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/firefox/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/firefox/commits/master)

## INTRODUCTION

Docker image of :

- [firefox](https://www.mozilla.org/en-US/firefox/new/) in french

Automatically updated on : [docker hub public](https://hub.docker.com/r/alexandreoda/firefox).

## PREREQUISITES

Use [docker](https://www.docker.com)

## INSTALL

### DOCKER RUN

```\
docker run -d \
--name firefox \
--group-add audio \
--device /dev/snd \
-e DISPLAY \
-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
-v ${HOME}:/home/firefox \
-v /tmp/.X11-unix/:/tmp/.X11-unix/ \
-v /dev/shm:/dev/shm \
-v /var/run/dbus:/var/run/dbus \
-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
-p 80 \
-p 443 \
alexandreoda/firefox
```

### DOCKER COMPOSE

```yml
version: "3.7"

services:
  firefox:
    container_name: firefox
    image: alexandreoda/firefox
    restart: "no"
    privileged: false
    devices:
      - /dev/snd
    environment:
      - DISPLAY
      - PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native
    volumes:
      - "${HOME}:/home/firefox"
      - "/tmp/.X11-unix/:/tmp/.X11-unix/"
      - "/dev/shm:/dev/shm"
      - "/var/run/dbus:/var/run/dbus"
      - "${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native"
    ports:
      - "443"
      - "80"
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/firefox/blob/master/LICENSE)
