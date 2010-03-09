#!/bin/sh
## @(#) created by arne
#######################
##
## the DOS theme
##

TITLE="SH-DOS [${TTY##*/}]"

#ksh
if test "x$RANDOM" != x
then
_bashish_TRANSDIR()
{
	if test "x$PROMPTSTR" = x
	then
		printf C:"${PWD//\//\\\\\\\\}"|tr a-z A-Z
	else
		printf ${PROMPTSTR//\//\\\\}|tr a-z A-Z
	fi
}

fi

if test "x$BASH" != x -o "x$ZSH_NAME" != zsh
then
#bash
_bashish_fail()
{
	RETSTATUS="$?"
	case "$RETSTATUS" in
	0|1) return "$RETSTATUS";;
	128|127) echo "Bad command or file name";;
	*)echo "Abort, Retry, Fail?"
	esac
	return $RETSTATUS
}

_bashish_TRANSDIR()
{
	if test "x$PROMPTSTR" = x
	then
		echo -nE C:"${PWD//\//\\\\}"|tr a-z A-Z
	else
		echo -nE ${PROMPTSTR//\//\\\\}|tr a-z A-Z
	fi
}
fi


_bashish_prompt()
{
	eval $(_bashish_prompt_shellvars $SHELLNAME)
	eval $(_bashish_prompt_parsecolors "$@")
	PROMPT_COMMAND=_bashish_fail


	PS1="`_bashish_TRANSDIR`> "
	if test "x${BASHISH_COLOR0}" != x
	then
		PS1="${EMBED}${ESC}[0;3${BASHISH_COLOR0}m${UNEMBED}$PS1${EMBED}${ESC}[0m${UNEMBED}"
	fi
}
