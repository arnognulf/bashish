#!/bin/sh

_bashish_prompt_appleiie_firstrun()
{
local CHARS i=0
let CHARS=${COLUMNS}*${LINES}
while test $i -lt ${CHARS}
do
	let i++
	printf ▒
done
sleep 0.5
clear
_bashish_prompt_asciilogo xcenter appleiie
printf "${ESC}[${LINES};0H"
_bashish_prompt_appleiie_firstrun() { :;}
}
_bashish_prompt()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
PROMPT_COMMAND="_bashish_prompt_cbmerror $?"

test "x$PROMPTSTR" = x && local PROMPTSTR=""
TITLE="Apple //e"
PS1="${PROMPTSTR}]"
PS2="?SYNTAX ERROR
"
_bashish_prompt_appleiie_firstrun

#_bashish_prompt_asciilogo xcenter boot
}