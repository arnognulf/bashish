#!/bin/sh
## @(#) created by arne
#######################
## theme: amiga
##
## the amiga CLI prompt
## the title and the prompt is 100% correct as of the kickstart 1.3 rom
## seen in the UAE emulator
_bashish_prompt()
{
PS1="${TTY##*/}>"
TITLE="New Cli Window"
}