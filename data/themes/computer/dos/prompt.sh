#!/bin/sh
## @(#) created by arne
#######################
##
## the DOS theme
##

#bourne

_bashish_TRANSDIR()
{
	if test "x$PROMPTSTR" = x
	then
		printf C:$PWD|sed "s/\//\\\\\\\\/g"|tr a-z A-Z
		#printf C:"${PWD//\//\\\\\\\\}""> "|tr a-z A-Z
	else
		printf $PROMPTSTR|tr a-z A-Z
	fi
}


_bashish_prompt()
{
	eval $(_bashish_prompt_shellvars $SHELLNAME)
	eval $(_bashish_prompt_parsecolors "$@")
	local RCS_PS1=$(_bashish_prompt_rcs)
	test "x${RCS_PS1}" != x && RCS_PS1=$(echo "|${RCS_PS1}"|tr a-z A-Z)
	local ROOT=">"
	test "x${UID}" = x0 && ROOT="#"


	PS1="`_bashish_TRANSDIR`${RCS_PS1}${ROOT} "
	if test "x${BASHISH_COLOR0}" != x
	then
		PS1="${EMBED}${ESC}[0;3${BASHISH_COLOR0}m${UNEMBED}$PS1${EMBED}${ESC}[0m${UNEMBED}"
	fi
	
}


