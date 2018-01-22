#!/bin/sh
# copy from nested display (default :2) to host display
test -z "${1}" && SRC=:2 || SRC=$1
xclip -selection clip -o -display $SRC | xclip -selection clip -i -display :1
# primary is for console
# xclip -selection primary -o -display $SRC | xclip -selection primary -i -display :1
