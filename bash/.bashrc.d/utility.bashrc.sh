#!/usr/bin/env bash

# 'qf' family scripts were using 'bfs' which was more faster than 'fd' but
# recent 'fd' update improves performances
# 'bfs' still used to find binaries

# general quick find
qf() {
    command fd --no-ignore-vcs --hidden "${1}" "${@:2}"
}

# quick file directory
qfd() {
    command fd --no-ignore-vcs --hidden --type d "${1}" "${@:2}"
}

# quick find file
qff() {
    command fd --no-ignore-vcs --hidden --type f "${1}" "${@:2}"
}

# quick find exact
qfe() {
    command fd --no-ignore-vcs --hidden --type f "^${1}$" "${@:2}"
}

# quick find filetypes
qft() {
    local _ext=""
    local _arg="${!#}"
    local _args=(${@:1:$#-1})
    if [[ "/" = "${_arg: -1}" ]]; then
        for arg in ${_args[@]}; do _ext+="-e ${arg} "; done
        command fd --no-ignore-vcs --hidden --type f ${_ext} . ${_arg}
    else
        for arg in ${@}; do _ext+="-e ${arg} "; done
        command fd --no-ignore-vcs --hidden --type f ${_ext}
    fi
}

# quick find binary - this version does not include ARM/ELF
qfb() {
    bfs ${2:-.}  -type f \(      \
               ! -iname "*.so*"  \
               ! -iname ".*"     \
               ! -iname "CMake*" \
               ! -iname "*.dll"  \
               ! -iname "*.tiff" \
               ! -iname "*.png"  \
               ! -iname "*.ai"   \
               ! -iname "*.pdf"  \
               ! -iname "*.ttf"  \
                  \) -iname "*${1}*" -executable -exec sh -c "
        file -i '{}' | grep -q \"application.*charset=binary\"
        " \; -print              \
            2> /dev/null
}

