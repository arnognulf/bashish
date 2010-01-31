## @(#) created by arne
#######################
##
## the DOS theme
##
_bashish_TRANSDIR ()
{
	echo -nE ${PWD//\//\\\\}|tr a-z A-Z
}
function _bashish_promptcmd
{
	PS1="C:`_bashish_TRANSDIR`> "
}

_bashish_promptcmd
PROMPT_COMMAND=_bashish_promptcmd
