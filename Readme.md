# Docker Arcade Machine Emulator
At Praqma we're a bunch of geeks.
We like Docker as the cool platform that enables us to do DevOps, orchestration of services, continous deployment and a ton of buzzword-worthy things.

Generally we like Docker because it enables us to to do awesome things.

We also have a taste for retro games, and this inspired us to start this little proof of concept.

Docker is mainly known for the epicness it brings to stuff to do with servers.

A lesser known feature of Docker is that you ( at least on Linux and Os X ) can run GUI applications inside of Docker containers.

For your tech savvy people I don't need to tell you all the implications that this has in terms of privacy and security, by running for instance your browser in disposable containers. For this you can check out [Subuser](https://subuser.org/) .

This is of course boring and technical stuff, so we did something more entertaining.

MAME is the Multiple Arcade Machine Emulator, that allows you to run games from arcade cabinets on your home computer.

So we present to you DAME ( Dockerized Arcade Machine Emulator ).

Clone this repository, put roms in `roms/` and run `start.sh` .
This will run MAME with access to the roms, and you can play any of the games that are present.

We do not take a stance on the distribution of ROMs and of course encourage you to respect any and all copyrights.
We just want to enable you to play the games of the past.

## Further work
There are a bunch of configuration that is not enabled at the moment, this is just the very initial MVP.

Sound does not work - We need to fiddle a bit more with mapping devices from the host system to Docker.

Linux only support, we'd also like to be able to run on OsX, Windows is as far as we know not possible with the current version of Docker. ( Also there it will not be possible to attach to the X windows manager socket :P ).

So all in all this is a cool proof of concept that we at least will have fun running :)