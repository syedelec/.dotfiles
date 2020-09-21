# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###############################################################################
#                              options settings                               #
###############################################################################

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# automatically correct mistyped directory names on cd
shopt -s cdspell

# save all lines of a multiple-line command in the same history entry.
# this allows easy re-editing of multi-line commands.
shopt -s cmdhist

# don't enable completion on empty line.
shopt -s no_empty_cmd_completion

# enable several extended pattern matching operators are recognized
# ?(pattern-list)
#     Matches zero or one occurrence of the given patterns
# *(pattern-list)
#     Matches zero or more occurrences of the given patterns
# +(pattern-list)
#     Matches one or more occurrences of the given patterns
# @(pattern-list)
#     Matches one of the given patterns
# !(pattern-list)
#     Matches anything except one of the given patterns
# shopt -s extglob

###############################################################################
#                              general settings                               #
###############################################################################

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# unlimited bash history
HISTSIZE=
HISTFILESIZE=

# define commands that should be ignored
# the commands must be separated by a double point and include the exact
# option and flag parameters
# e.g: HISTIGNORE="pwd:ls:ls -ltr:ls -lAhF:cd ..:.."
HISTIGNORE="$(cat ${HOME}/.histignore | sed -e ':a;N;$!ba;s/\n/:/g')"

# make sure to source bash_completion
source /usr/share/bash-completion/bash_completion

for bash_sh in ${HOME}/.bashrc.d/*.bashrc.sh; do
    # shellcheck source=/dev/null
    [ -f ${bash_sh} ] && source "${bash_sh}"
done

###############################################################################
#                                     PS1                                     #
###############################################################################

# trim dir in PS1 if exceeds number of folder
export PROMPT_DIRTRIM=5

RST="\[\033[0m\]"
RED="\[\033[31m\]"
YEL_1="\[\033[38;5;179m\]"
PRL="\[\033[35m\]"

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

if [[ $EUID -eq 0 ]]; then
    PS1="> ${RED}\u ${YEL_1}\w${PRL} \`_git_ps1\`${RED}» ${RST}"
else
    PS1="> ${YEL_1}\w${PRL} \`_git_ps1\`${RED}» ${RST}"
fi

###############################################################################
#                                    extra                                    #
###############################################################################

# do not map Ctrl-S in terminal
stty -ixon

# extra unicode char
# ❯❯ ›› 〉〉ᐳᐳ ❭❭ >> ≫  » >>

