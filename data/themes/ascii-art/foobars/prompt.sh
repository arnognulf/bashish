#!/bin/bash
##################################################################################
## Bashish, a console theme engine
## Copyright (C) 2005 Thomas Eriksson
##
## This program is free software; you can redistribute it and/or
## modify it under the terms of the GNU General Public License
## as published by the Free Software Foundation; either version 2
## of the License, or (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
##
## along with this program; if not, write to the Free Software
## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
##################################################################################


_bashish_prompt ()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
eval $(_bashish_prompt_parsecolors "$@")
test "x${BASHISH_COLOR0}" = x && eval $(_bashish_prompt_parsecolors red green blue)
test "x${BASHISH_COLOR1}" = x && eval $(_bashish_prompt_parsecolors $1 red white)
test "x${BASHISH_COLOR2}" = x && eval $(_bashish_prompt_parsecolors $1 $2 white)

local i=0
local FILLY=""
PROMPT_COMMAND="_BASHISH_PROMPT_RCS=\$(_bashish_prompt_rcs \${_BASHISH_PROMPT_RCS} ) && _bashish_promptupdate"

local RCS_PS1=$(_bashish_prompt_rcs)
test "x${RCS_PS1}" != x && RCS_PS1="${ESC}[3${BASHISH_COLOR1}m  ${ESC}[3${BASHISH_COLOR2}m${RCS_PS1}"

test "x$PROMPTSTR" = x && local PROMPTSTR="${USER}${ESC}[4${BASHISH_COLOR0};3${BASHISH_COLOR1}m@${ESC}[3${BASHISH_COLOR2}m${HOSTNAME%%.*}"

local ROOT="="
test "x${UID}" = x0 && ROOT="#"
local CWD_SEPCOLOR="${ESC}[${INVERSE};${BOLD};4${BASHISH_COLOR1}${SETCOLOR}"
local CWD_TXTCOLOR="${ESC}[0;${INVERSE}${SETCOLOR}"
local CWD_STR=$(_bashish_prompt_cwd ${SHELLNAME} "${CWD_SEPCOLOR}" "${CWD_TXTCOLOR}" 42 embedall)

PS1="${EMBED}\
${ESC}[2A\
${ESC}[2B\
${ESC}[${NORMAL}${SETCOLOR}\
${ESC}7\
${ESC}[0m\
${ESC}[0;$(($LINES - 1))r\
${ESC}[$LINES;0H\
${ESC}[K\
${ESC}[0;4${BASHISH_COLOR0}m\
     \
${ESC}[0;${INVERSE}${SETCOLOR}\
 ${USER}\
${ESC}[4${BASHISH_COLOR0}${SETCOLOR}\
@\
${ESC}[0;${INVERSE}${SETCOLOR}\
${HOSTNAME%%.*} \
${ESC}[${NORMAL}${SETCOLOR}\
 \
${ESC}[0;3${WHITE};4${BASHISH_COLOR1}${SETCOLOR}\
     \
${ESC}[0;${INVERSE}${SETCOLOR}\
${UNEMBED}\
 ${CWD_STR} \
${EMBED}\
${ESC}[${NORMAL}${SETCOLOR}\
 \
${ESC}[0;4${BASHISH_COLOR2}m\
     \
${ESC}[0;${INVERSE}${SETCOLOR}\
 baz \
${ESC}[${NORMAL}${SETCOLOR}\
 \
${ESC}8\
${ESC}[${NORMAL};${INVERSE}m\
${UNEMBED}\
 \$ \
${EMBED}\
${ESC}[${NORMAL}m\
${UNEMBED}\
 "
}
