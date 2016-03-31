#!/bin/bash

kernel_name=$(uname -s)

if [ "$kernel_name" == "Linux" ]
then
  docker run --privileged \
             --net=host \
             -e DISPLAY \
             -v /dev/snd:/dev/snd \
             -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
             praqma/dame /usr/games/mame
elif [ "$kernel_name" == "Darwin" ]
then
  # Mac OSX
  ## Remember to start socat first in another terminal

  ## Start XQuartz to show windows
  open -a XQuartz

  ## On OSX you need to set the DISPLAY variable to the IP of your vboxnet0 network interface
  docker run --privileged \
             --net=host \
             -e DISPLAY=192.168.99.1:0 \
             -v /dev/snd:/dev/snd \
             -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
             praqma/dame /usr/games/mame
else
  echo OS not supported: $kernel_name
fi
