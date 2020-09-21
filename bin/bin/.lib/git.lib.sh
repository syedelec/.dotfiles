#!/usr/bin/env bash

source ${HOME}/bin/.lib/core.lib.sh


__is_git_repo__() {
    __check_binary__ git || return 1
    if [ $# -eq 0 ]; then
        git rev-parse HEAD &> /dev/null || return 1
    else
        [ -d ${1} ] || {
            echo "fatal: folder ${1} does not exist"
            return 1
        }
        git -C ${1} rev-parse HEAD &> /dev/null || return 1
    fi
}

__check_untracked__() {
    __check_binary__ git || return 1
    git -C $(git root) ls-files -o --directory --exclude-standard | sed -n q1
    [ $? -eq 1 ] && {
        echo "warning: untracked files detected"
        return 1
    }
}

