#! /usr/bin/env zsh
# Author: Dimitar Dimitrov
#         kurkale6ka

export SHELL=/usr/bin/zsh

path=(~/bin $path)
typeset -U path # remove any duplicates from the array

export PYTHONSTARTUP=~/.pyrc

export LANG=en_GB.UTF-8
export LC_COLLATE=C

# Remove w permissions for group and others
# file      default: 666 (-rw-rw-rw-) => 644 (-rw-r--r--)
# directory default: 777 (drwxrwxrwx) => 755 (drwxr-xr-x)
umask 022

## Vim
if command -v nvim >/dev/null 2>&1
then nvim=nvim
else nvim=vim
fi

export EDITOR=$nvim
export VISUAL=$nvim

export MYVIMRC=~/.vimrc
export MYGVIMRC=~/.gvimrc

## ps
export PS_PERSONALITY=bsd
export PS_FORMAT=pid,ppid,pgid,sid,tname,tpgid,stat,euser,egroup,start_time,cmd

# -i   : ignore case
# -r/R : raw control characters
# -s   : Squeeze multiple blank lines
# -W   : Highlight first new line after any forward movement
# -M   : very verbose prompt
# -PM  : customize the very verbose prompt (there is also -Ps and -Pm)
# ?letterCONTENT. - if test true display CONTENT (the dot ends the test) OR
# ?letterTRUE:FALSE.
# ex: ?L%L lines, . - if number of lines known: display %L lines,
export LESS='-i -r -s -W -M -PM?f%f - :.?L%L lines, .?ltL\:%lt:.?pB, %pB\% : .?e(Bottom)%t'

# Needs installing x11-ssh-askpass
# TODO: fix keyboard layout issue
if [[ -n $SSH_ASKPASS ]] && test -x "$(command -v keychain)"
then
   setxkbmap -layout gb
   eval "$(keychain --eval --agents ssh -Q --quiet id_rsa id_rsa_git)"
fi