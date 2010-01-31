#!/bin/sh

PROMPT_COMMAND=locset
locset ()
{
LOC=$USER@$HOSTNAME
LOCL=${#LOC}
let LOCM=$LOCL+1
}
PS1="\[\033[J\033[0;"$(($LINES - 1))"r\033["$LINES";0H"'`_bashish_prompt_cwd "[3"${MAINCOLOR}"m" "[9"${MAINCOLOR}"m" $LOCM`'"  [9"${MAINCOLOR}"m["$LINES";"$(($COLUMNS - $LOCL + 1))"H$USER[3"${MAINCOLOR}"m@[9"${MAINCOLOR}"m$HOSTNAME
["$(($LINES - 1))";0H\]>[0m\]"

PS2="\[[3"$MAINCOLOR"m\]>\[[9"$MAINCOLOR"m\]>\[[0m\]>"
