#!/usr/bin/env sh

# .Xresources config
[ -s ${HOME}/.Xresources ] && xrdb ${HOME}/.Xresources

# enable numlock
which numlockx &> /dev/null && numlockx on

