#!/bin/sh
# copy from host display to nested display (:2) by default
test -z "${1}" && DEST=:2 || DEST=$1
# primary is for console
# xclip -selection primary -o -display :1 | xclip -selection primary -i -display $DEST
# clipboard is for web browser etc
xclip -selection clip -o -display :1 | xclip -selection clip -i -display $DEST
