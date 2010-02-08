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
_bashish_TRANSDIR()
{
	if test "x$PROMPTSTR" = x
	then
		printf C:"${PWD//\//\\\\}"|tr a-z A-Z
	else
		printf ${PROMPTSTR//\//\\\\}|tr a-z A-Z
	fi
}
fi


_bashish_prompt()
{
	PS1="`_bashish_TRANSDIR`> "
}
