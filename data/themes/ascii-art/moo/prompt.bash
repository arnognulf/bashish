#!/bin/sh
_bashish_prompt()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
PS1="\
${ESC}[91m▄${ESC}[37;40m${ESC}[7m'${ESC}[0m
${ESC}[0m ${ESC}[37;40m${ESC}[7m"`_bashish_prompt_fillx "  ▀██ ▄▄  ▄█ ▄██▄" 2`"${ESC}[0;37m┐${ESC}[0m
 ┃┃ ${EMBED}${ESC}7${ESC}["$(($COLUMNS - 9))"C${ESC}[91m▀▀${ESC}[37m┃┃${ESC}8${ESC}[0m${UNEMBED}"
}
