#!/bin/sh
# Created by icetrey <trey@imagin.net>
# Added by Spidey 08/06
# updated to bashish by arno

_bashish_prompt ()
{
eval $(_bashish_prompt_shellvars "$SHELLNAME")
eval $(_bashish_prompt_parsecolors "$@")
#test x$BASHISH_COLOR0 = x && eval $(_bashish_prompt_parsecolors cyan)
test "x$BASHISH_COLOR0" = x && eval $(_bashish_prompt_parsecolors cyan cyan black)
test "x$BASHISH_COLOR1" = x && eval $(_bashish_prompt_parsecolors "$1" cyan black)
test "x$BASHISH_COLOR2" = x && eval $(_bashish_prompt_parsecolors "$1" "$2" black)

local COLOR1="${EMBED}${ESC}[0;3${BASHISH_COLOR0}m${UNEMBED}"
local COLOR2="${EMBED}${ESC}[1;3${BASHISH_COLOR1}m${UNEMBED}"
local COLOR3="${EMBED}${ESC}[1;3${BASHISH_COLOR2}m${UNEMBED}"
local COLOR4="${EMBED}${ESC}[0m${UNEMBED}"

local BASHISH_CWD=`_bashish_prompt_cwd $SHELLNAME "${ESC}[1;3${BASHISH_COLOR2}m" "${ESC}[0;3${BASHISH_COLOR0}m" 39`

local BASHISH_DA=`_bashish_prompt_cp437 DA` # ┌
local BASHISH_C0=`_bashish_prompt_cp437 C0` # └
local BASHISH_C4=`_bashish_prompt_cp437 C4` # ─

PROMPT_COMMAND="_BASHISH_PROMPT_RCS=\$(_bashish_prompt_rcs \${_BASHISH_PROMPT_RCS} ) && _bashish_promptupdate"

local BASHISH_RCS=$(_bashish_prompt_rcs)
test "x${BASHISH_RCS}" != x && BASHISH_RCS="${COLOR3}|${COLOR1}${BASHISH_RCS}"


test x$PROMPTSTR = x && local PROMPTSTR="${USER}$COLOR3@$COLOR1${HOSTNAME%%.*}"
PS1="$COLOR3${BASHISH_DA}\
$COLOR1${BASHISH_C4}\
$COLOR2(\
$COLOR1\
$PROMPTSTR\
$COLOR2)\
$COLOR1${BASHISH_C4}\
$COLOR2(\
$COLOR1\#\
$COLOR3/\
$COLOR1${TTY##*/}\
$COLOR2)\
$COLOR1${BASHISH_C4}\
$COLOR2(\
${COLOR1}\
${TIME}\
${COLOR3}\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C\
${ESC}[31m\
$COLOR3${BASHISH_C4}\
$COLOR1\$(date +%m/%d)\
$COLOR3\
${ESC}[3D/\
${ESC}[2C\
$COLOR2)\
$COLOR1${BASHISH_C4}\
$COLOR3-\
$COLOR4
$COLOR3${BASHISH_C0}\
$COLOR1${BASHISH_C4}\
$COLOR2(\
$COLOR1\$\
$COLOR3:\
$COLOR1${BASHISH_CWD}\
${BASHISH_RCS}\
$COLOR2)\
$COLOR1${BASHISH_C4}\
$COLOR3-\
$COLOR4 " 
PS2="\
$COLOR2${BASHISH_C4}\
$COLOR1${BASHISH_C4}\
$COLOR3-\
$COLOR4 "
}