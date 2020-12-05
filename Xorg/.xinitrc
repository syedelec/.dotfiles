#!/usr/bin/env sh

# .Xresources config
[ -s ${HOME}/.Xresources ] && xrdb ${HOME}/.Xresources

# enable numlock
which numlockx &> /dev/null && numlockx on

# disable caps lock
which setxkbmap &> /dev/null && setxkbmap -option caps:none

