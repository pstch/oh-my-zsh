#!/bin/sh

# code originally from https://github.com/tristan0x/oh-my-zsh/

# get list of available X windows.
x=`emacsclient --alternate-editor '' --eval '(x-display-list)' 2>/dev/null`

if [ -z "$x" ] ;then
    # Create one if there is no X window yet.
    emacsclient --alternate-editor "" -nw --create-frame "$@"
else
    # prevent creating another X frame if there is at least one present.
    emacsclient --alternate-editor "" -nw "$@"
fi
