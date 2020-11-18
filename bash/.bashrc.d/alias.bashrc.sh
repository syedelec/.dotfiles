#!/usr/bin/env bash

# enable color support of ls and also add handy aliases
if [ -x $(command -v dircolors) ]; then
    test -r ~/.dir_colors && eval "$(dircolors -b ~/.dir_colors)" || eval "$(dircolors -b)"

    alias ls='LC_COLLATE=C ls --color=auto'
    alias grep='grep --color=auto'
fi

# ls aliases
# -A : all files without ./ and ../
# -l : long list format
# -F : append operator to entries
# -h : human size
# LC_COLLATE=C : sort dot first
alias l='ls -C --group-directories-first'
alias ll='ls -Al --group-directories-first'
alias lls='ls -hAl --group-directories-first'

alias mount='mount | column -t'
alias mkdir='mkdir -pv'
alias ping='ping -c 3'

# or `nproc`
alias m='make -s -j`getconf _NPROCESSORS_ONLN`'

# again more aliases
alias tree='LC_COLLATE=C tree -aC -I ".git|node_modules|bower_components|plugged|__pycache__|CMakeFiles" --dirsfirst'

# force using fd binary
alias f='command fd'
alias dtrx='dtrx --noninteractive'

# -rr - read-only mode (prevents delete and spawn shell)
alias ncdu='ncdu -rr -x -X ~/.ignore'

