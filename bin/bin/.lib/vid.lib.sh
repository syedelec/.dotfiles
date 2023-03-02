#!/usr/bin/env bash

source ${HOME}/bin/.lib/core.lib.sh


__check_vid__() {
    __check_binary__ ffprobe || return 1
    __check_no_args__ ${@} || return 1

    __check_files_exist__ ${@} || return 1
    local videos=("${@}")
    for video in ${videos[@]}; do
        ffprobe "${video}" &> /dev/null || {
            echo "fatal: '${video}' is not a valid video"
            return 1
        }
    done
}

