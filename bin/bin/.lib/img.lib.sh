#!/usr/bin/env bash

source ${HOME}/bin/.lib/core.lib.sh


__check_img__() {
    __check_no_args__ ${@} || return 1
    __check_binary__ identify || return 1
    __check_files_exist__ ${@} || return 1
    local images=("${@}")
    for image in ${images[@]}; do
        identify ${image} &> /dev/null || {
            echo "fatal: '${image}' is not a valid image"
            return 1
        }
    done
}

__img_rotate__() {
    __check_binary__ convert || return 1
    if [ $# -lt 2 ]; then
        echo "fatal: wrong arguments provided"
        return 1
    fi

    local angle="${1}"

    local input_image="${2}"
    __check_img__ ${input_image} || return 1

    local input_path_filename="${input_image%.*}"

    local input_name="$(basename ${input_image})"
    local input_extension="${input_name##*.}"
    local input_filename="${input_name%.*}"

    local output_image=""

    if [ -z "${3}" ]; then
        output_image="${input_path_filename}_rotated.${input_extension}"
    else
        local output_folder=${3}
        [ -d ${output_folder} ] || mkdir ${output_folder} &> /dev/null
        output_image="${output_folder}/${input_filename}_rotated.${input_extension}"
    fi

    echo "output: ${output_image}"

    # convert ${input_image} -rotate 90 ${output_image}

    # if [ $? -eq 0 ]; then
    #     echo "success: rotated image ${input_name} with angle=${angle}"
    # else
    #     echo "fatal: error during processing"
    #     echo "    usage: $ ${FUNCNAME[0]} <[+/-]angle> <input>"
    #     return 1
    # fi
}

