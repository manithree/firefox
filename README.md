# FIREFOX

<img src="https://telecharger.itespresso.fr/wp-content/uploads/2013/02/logo-1024x982.png" />


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequisites](#PREREQUISITESITES)
- [Install](#INSTALL)
- [License](#LICENSE)


## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/firefox/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/firefox/commits/master)


## INTRODUCTION

Docker image of :

- [firefox](https://www.mozilla.org/en-US/firefox/new/) in french

Automatically updated on : [docker hub public](https://hub.docker.com/r/alexandreoda/firefox).


## PREREQUISITES

Use [docker](https://www.docker.com)


## INSTALL

```
docker run -d --name firefox -v ${HOME}:/home/firefox -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) -e DISPLAY --network host alexandreoda/firefox
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/firefox/blob/master/LICENSE)
