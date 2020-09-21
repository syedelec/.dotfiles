#!/usr/bin/env bash

source ${HOME}/bin/.lib/core.lib.sh


__check_pdf__() {
    __check_binary__ qpdf || return 1
    __check_no_args__ "${@}" || return 1

    __check_files_exist__ "${@}" || return 1
    local pdfs=("${@}")
    for pdf in "${pdfs[@]}"; do
        qpdf --check "${pdf}" &> /dev/null || {
            echo "fatal: '${pdf}' is not a valid PDF. Possible fix:"
            echo ">>> qpdf \"${pdf}\" \"output.pdf\""
            return 1
        }
    done
}

__pdf_rotate__() {
    __check_binary__ qpdf || return 1
    if [ $# -lt 2 ]; then
        echo "fatal: wrong arguments provided"
        return 1
    fi

    local pages
    local angle="${1}"
    local output_pdf="output_rotated.pdf"

    local input_pdf="${2}"
    __check_pdf__ "${input_pdf}" || return 1

    # qpdf in.pdf out.pdf --rotate=[+|-]angle[:page-range]
    if [ $# -eq 2 ]; then
        pages=("all")
        echo "warning: no pages specified, rotating all pages of ${input_pdf}..."
        qpdf ${input_pdf} ${output_pdf} --rotate=${angle}
    else
        shift 2
        pages=("${@}")
        pages_commas=$(IFS=, ; echo "${pages[*]}")
        qpdf ${input_pdf} ${output_pdf} --rotate=${angle}:${pages_commas[@]}
    fi

    [ $? -eq 0 ] || return 1 &&
        echo "success: rotated pages ${pages[@]} of ${input_pdf} with angle=${angle}"
}

