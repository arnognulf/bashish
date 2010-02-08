## @(#) created by arne
#######################
##
## the DOS theme
##

TITLE=SH-DOS
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
	PS1="`_bashish_TRANSDIR`> "
}

_bashish_prompt

