#!/bin/bash

kernel_name=$(uname -s)

if [ "$kernel_name" == "Linux" ]
then
  docker run --rm --privileged -it \
             --net=host \
             -e DISPLAY \
             -v /dev/snd/:/dev/snd/ \
             -v /dev/shm/:/dev/shm/ \
             -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
             -v=/dev/dri:/dev/dri:rw \
             praqma/dame:latest /usr/games/mame

elif [ "$kernel_name" == "Darwin" ]
then
  # Mac OSX

  ## Enable X11 listening by exposing a local XQuartz socket on TCP port 6000
  (socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\") &

  ## Start XQuartz to show X11 windows
  open -a XQuartz

  ## On OSX you need to set the DISPLAY variable to the IP of your vboxnet0 network interface
  vboxnet0_ip=$(ifconfig vboxnet0 | grep -Eo 'inet [0-9]+.[0-9]+.[0-9]+.[0-9]+' | cut -d " " -f 2)
  docker run --privileged \
             --rm \
             --net=host \
             -e DISPLAY=$vboxnet0_ip:0 \
             -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
             praqma/dame /usr/games/mame

  osascript -e 'quit app "XQuartz"'
  ## When docker finishes, stop socat by killing the last background process
  kill $!

else
  echo OS not supported: $kernel_name
fi
