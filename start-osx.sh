#!/bin/bash

## On OSX you need to set the DISPLAY variable to the IP of your vboxnet0 network interface
docker run --privileged \
           --net=host \
           -e DISPLAY=192.168.99.1:0 \
           -v /dev/snd:/dev/snd \
           -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
           praqma/dame /usr/games/mame

