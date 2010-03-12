#!/bin/sh
## @(#) created by arne
#######################
## theme: amiga
##
## the amiga CLI prompt
## the title and the prompt is 100% correct as of the kickstart 1.3 rom
## seen in the UAE emulator

_bashish_guru()
{
	local RETVALUE="$?"
	test x$RETVALUE = x0 && return 0
	test x"$?" = x255 && return "$RETVALUE"
	test $RETVALUE -lt 136 && return "${RETVALUE}"
	clear
	printf "\033[40m"
	local BASHISH_ASCIILOGO=""
	BASHISH_ASCIILOGOG= _bashish_prompt_asciilogo logo.guru 32
	read -n1
	printf "\033[0m"
	clear
	return ${RETVALUE}
}
_bashish_prompt()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
PROMPT_COMMAND="_bashish_guru"
_bashish_prompt_asciilogo nocenter logo.start
test "x${PROMPTSTR}" = x && local PROMPTSTR="${TTY##*/}"
test "x${TITLESTR}" = x && local TITLESTR="AmigaDOS"

PS1="${PROMPTSTR}>"
TITLE="${TITLESTR}"
}
