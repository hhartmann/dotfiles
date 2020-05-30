#!/bin/bash
# This file runs once at login.

# Bash
PS1="\u \w * "

# Add all local binary paths to the system path.
export PATH="$PATH:$HOME/.local/bin"

# Default programs to run.
export EDITOR="vim"

# If bash is the login shell, the source ~/.bashrc
if [ -r ~/.bashrc ] ; then
   source ~/.bashrc
fi

