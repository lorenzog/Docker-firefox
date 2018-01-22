#!/bin/sh
# copy from host display to nested display (:2) by default
test -z "${1}" && DEST=:2 || DEST=$1
xclip -selection clip -o -display :0 | xclip -selection clip -i -display $DEST
