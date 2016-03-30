# Mac OSX Setup

How to run DAME on OSX

## Installation stuff

You need `socat` and `XQuartz`

```sh
brew install socat
brew cask install xquartz
```

## Configuration

Go to XQuartz, Preferences, Security and check both check boxes.

## Running

First start `socat`. Then start `XQuartz` in another window, then run your `docker` command.

```sh
$ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
<new terminal>
$ open -a XQuartz
$ ./start.sh
```

