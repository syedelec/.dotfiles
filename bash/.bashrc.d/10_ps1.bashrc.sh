#!/usr/bin/env bash

###############################################################################
#                                     PS1                                     #
###############################################################################

# trim dir in PS1 if exceeds number of folder
export PROMPT_DIRTRIM=5

# colorterm 256
RST="\[\033[0m\]"
RED="\[\033[31m\]"
YEL_1="\[\033[38;5;179m\]"
PRL="\[\033[35m\]"
GRY="\[\033[38;5;247m\]"

_git_ps1() {
    git rev-parse HEAD &> /dev/null || return

    local dirty deleted untracked newfile renamed
    local branch
    local bits

    git status --porcelain --branch | (
        while read line ; do
            case "${line//[[:space:]]/}" in
                '##'*)         branch=$(echo $line |
                                        awk '{ gsub(/\.\.\.+/, " " );
                                             print $2; }') ; ;;
                'M'*)          dirty='!' ; ;;
                'D'*)          deleted='x' ; ;;
                '??'*)         untracked='?' ; ;;
                'A'*)          newfile='+' ; ;;
                'R'*)          renamed='>' ; ;;
            esac
        done
        bits="$dirty$deleted$untracked$newfile$renamed"
        [ -n "$bits" ] && echo "[$branch $bits] " || echo "[$branch] "
    )
}

if [ $EUID -eq 0 ]; then
    PS1="> ${RED}\u ${YEL_1}\w${GRY} \`_git_ps1\`${RED}» ${RST}"
else
    PS1="> ${YEL_1}\w${GRY} \`_git_ps1\`${RED}» ${RST}"
fi

