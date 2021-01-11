#!/usr/bin/env bash

# source ${HOME}/bin/.lib/log.lib.sh


###############################################################################
#                                    utils                                    #
###############################################################################

__filter_uniq__() {
    perl -ne 'print if !$seen{($_ =~ s/^[0-9\s]*//r)}++'
}

__check_no_args__() {
    if [ $# -eq 0 ]; then
        echo "fatal: no arguments provided"
        return 1
    fi
}

__usage__() {
    __check_no_args__ "${@}" || return 1
    echo "usage: $ $(basename ${0}) ${@}"
}

__check_binary__() {
    __check_no_args__ "${@}" || return 1
    local -r binaries=("${@}")
    for binary in ${binaries[@]}; do
        command -v ${binary} >/dev/null 2>&1 || {
            echo "fatal: '${binary}' is not installed, aborting.."
            return 1
        }
    done
}

__check_files_exist__() {
    __check_no_args__ "${@}" || return 1
    local -r files=("${@}")
    for file in "${files[@]}"; do
        [ -f "${file}" ] || {
            echo "fatal: '${file}' does not exist"
            return 1
        }
    done
}

__question__() {
    if [ $# -ne 1 ]; then
        return 1
    fi
    local question="${1}"
    while true; do
        read -p "${question}" yn
        case ${yn} in
            [Yy]* ) return 0;;
            [Nn]* ) echo "Aborted."; return 1;;
            * ) echo -n "[error]: Proceed [Yy/Nn] ? "; question="";;
        esac
    done
}

###############################################################################
#                                process utils                                #
###############################################################################

__check_process_running__() {
    __check_binary__ pgrep || return 1
    local -r processes=("${@}")
    for process in "${processes[@]}"; do
        [ pgrep "${process}" ] || {
            echo "fatal: '${process}' not running"
            return 1
        }
    done
}

