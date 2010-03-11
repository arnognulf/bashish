#!/bin/sh
_bashish_prompt()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
PROMPT_COMMAND="_bashish_prompt_cbmerror $?"

test "x$PROMPTSTR" = x && local PROMPTSTR=READY
TITLE=C=
FILLX=`_bashish_prompt_fillx " "`
PS1="\
${EMBED}
${ESC}7\
${ESC}[r\
${ESC}8\
${ESC}[3F\
${ESC}[3E\
${ESC}[3E\
${ESC}[3F\
${ESC}7\
${ESC}[7m\
${ESC}[4;$(($LINES - 3))r\
${ESC}[0;0H\
$FILLX\
$FILLX\
$FILLX\
${ESC}[$(($LINES - 2));0H\
$FILLX$FILLX$FILLX\
${ESC}8\
${ESC}[0m\
${UNEMBED}\
${PROMPTSTR}
"
PS2="?SYNTAX ERROR
"
_bashish_prompt_asciilogo xcenter boot

}