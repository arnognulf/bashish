#!/usr/bin/env csh 

alias precmd "source $BASHISH_USERDIR/bt/prompt/prompt.tcsh"
set prompt="C:"`echo $PWD|tr 'a-z' 'A-Z'|sed 's/\//\\\\/g'`">"
