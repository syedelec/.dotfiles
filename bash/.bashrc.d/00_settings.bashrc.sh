#!/usr/bin/env bash

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
HISTFILE="${HOME}/.history"
HISTSIZE=
HISTFILESIZE=

# define commands that should be ignored
# the commands must be separated by a double point and include the exact
# option and flag parameters
# e.g: HISTIGNORE="pwd:ls:ls -ltr:ls -lAhF:cd ..:.."
HISTIGNORE="l:ls:ll:lls:cd:cd -:cd ~:cd .:cd ..:cd ../:pwd"

###############################################################################
#                                    extra                                    #
###############################################################################

# do not map Ctrl-S in terminal
stty -ixon

