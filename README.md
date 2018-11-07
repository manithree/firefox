# FIREFOX

![firefox](https://raw.githubusercontent.com/oda-alexandre/firefox/master/logo-firefox.png) ![docker](https://raw.githubusercontent.com/oda-alexandre/firefox/master/logo-docker.png)


## INDEX

- [Build Docker](#BUILD)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BUILD DOCKER

[![firefox docker build](https://img.shields.io/docker/build/alexandreoda/firefox.svg)](https://hub.docker.com/r/alexandreoda/firefox)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de [Firefox](https://www.mozilla.org/en-US/firefox/new/) pour [Docker](https://www.docker.com), mis à jour automatiquement dans le [Docker Hub](https://hub.docker.com/r/alexandreoda/firefox/) public.


## PREREQUIS

Installer [Docker](https://www.docker.com)


## INSTALLATION

```
docker run -d --name firefox -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) -v ${HOME}:/home/firefox -e DISPLAY --network host alexandreoda/firefox
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/firefox/blob/master/LICENSE)
