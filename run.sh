#!/bin/sh
Xephyr :2 -resizeable -screen 1024x768 &
DISPLAY=:2 fvwm &
docker run -v $PWD:/foo --rm -e DISPLAY=:2 -v /tmp/.X11-unix:/tmp/.X11-unix -it firefox-disposable $*
# docker run -v $PWD:/foo --rm -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix -it firefox-disposable
