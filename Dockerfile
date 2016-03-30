FROM debian:jessie
RUN useradd -ms /bin/bash gamer
RUN echo "deb http://httpredir.debian.org/debian jessie non-free" >> /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install -y mesa-utils xserver-xorg-video-all mame -y
USER gamer
RUN mkdir -p /home/gamer/mame/roms
COPY roms/ /home/gamer/mame/roms/
RUN ln -s /home/gamer/mame /home/gamer/.mame
