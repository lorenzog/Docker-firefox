Firefox-Docker
==============

Run a disposable Firefox instance in a Docker container.

Quickstart
----------

 1. One-off: prepare the Docker container:

        docker build -t firefox-disposable .

 2. Run the nested X server

        Xephyr :2 -resizeable

 3. Run firefox in the container

        docker run -v $PWD:/foo --rm -e DISPLAY=:2 -v /tmp/.X11-unix:/tmp/.X11-unix -it firefox-disposable

The browser should appear in the nested X server.

More details
------------

`Xephyr` has many options. For example:

    Xephyr :2 -screen 1400x900 -resizeable

It also helps to run a proper window manager in the nested X server, otherwise window resizing and handling will be a pain. Consider something lightweight like `i3`, `fluxbox` or `fvwm`:

    DISPLAY=:2 fvwm &

...then launch the docker container.

FAQ
---

 * Why a separate X server?

   Because every X application can read the keyboard. At any time.

 * But a malicious application could also check /tmp/.X11-unix/:1 and
   attach itself to it.

   That doesn't seem to be working on my set-up, unless I run `xhost +`
   on the host X server. Also if you're looking for a better set-up, try
   Qubes OS. It's awesome.

 * What about copy-paste?

   You need to use `xclip` or something similar to synchronise
   clipboards. See the `clipto.sh` and `clipfrom.sh` scripts for
   inspiration.
