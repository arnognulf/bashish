#!/bin/sh
# Created by icetrey <trey@imagin.net>
# Added by Spidey 08/06
# updated to bashish by arno

_bashish_prompt ()
{
eval $(_bashish_prompt_shellvars "$SHELLNAME")
eval $(_bashish_prompt_parsecolors "$@")
test x$BASHISH_COLOR0 = x && eval $(_bashish_prompt_parsecolors cyan)
local COLOR1="${EMBED}${ESC}[0;3${BASHISH_COLOR0}m${UNEMBED}"
local COLOR2="${EMBED}${ESC}[1;3${BASHISH_COLOR0}m${UNEMBED}"
local COLOR3="${EMBED}${ESC}[1;30m${UNEMBED}"
local COLOR4="${EMBED}${ESC}[0m${UNEMBED}"

$_typeset BASHISH_CWD=`_bashish_prompt_cwd "\\[\033[1;30m\\]" "\\[\033[0;3${BASHISH_COLOR0}m\\]" 39`

$_typeset BASHISH_DA=`_bashish_prompt_cp437 DA` # ┌
$_typeset BASHISH_C0=`_bashish_prompt_cp437 C0` # └
$_typeset BASHISH_C4=`_bashish_prompt_cp437 C4` # ─


test x$PROMPTSTR = x && $_typeset PROMPTSTR="${USER}$COLOR3@$COLOR1${HOSTNAME}"
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
)\
$COLOR1${BASHISH_C4}\
$COLOR3-\
$COLOR4
$COLOR3${BASHISH_C0}\
$COLOR1${BASHISH_C4}\
$COLOR2(\
$COLOR1\$\
$COLOR3:\
$COLOR1${BASHISH_CWD}\
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