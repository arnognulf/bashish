#!/bin/sh

_bashish_prompt()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
PROMPT_COMMAND="_bashish_prompt_cbmerror $?"

test "x$PROMPTSTR" = x && local PROMPTSTR="ready."
TITLE="C= CBM-II"
PS1="${PROMPTSTR}
"
PS2="?SYNTAX ERROR
"

_bashish_prompt_asciilogo nocenter boot
}