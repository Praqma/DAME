docker run --privileged --net=host -e DISPLAY -v /dev/snd:/dev/snd -v /tmp/.X11-unix:/tmp/.X11-unix:rw  hoeghh/mame /usr/games/mame
