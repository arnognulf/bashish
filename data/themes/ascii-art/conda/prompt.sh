#!/bin/sh
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
TITLE="( $USER @ ${HOSTNAME%%.*} )"
eval $(_bashish_prompt_shellvars $SHELLNAME)
eval $(_bashish_prompt_parsecolors "$@")
test "x${BASHISH_COLOR0}" = x && eval $(_bashish_prompt_parsecolors green red white)
test "x${BASHISH_COLOR1}" = x && eval $(_bashish_prompt_parsecolors $1 red white)
test "x${BASHISH_COLOR2}" = x && eval $(_bashish_prompt_parsecolors $1 $2 white)

local i=0
local FILLY=""
local BASHISH_CWD=`_bashish_prompt_cwd "${SHELLNAME}" "${ESC}[3${BASHISH_COLOR1}m" "${ESC}[3${BASHISH_COLOR2}m" 39`
PROMPT_COMMAND="_BASHISH_PROMPT_RCS=\$(_bashish_prompt_rcs \${_BASHISH_PROMPT_RCS} ) && _bashish_promptupdate"

local RCS_PS1=$(_bashish_prompt_rcs)
test "x${RCS_PS1}" != x && RCS_PS1="${ESC}[3${BASHISH_COLOR1}m)  (${ESC}[3${BASHISH_COLOR2}m${RCS_PS1}"

while test "$i" -lt $(($LINES))
do
	FILLY="$FILLY  ${ESC}[E"
	let i++
done

test "x$PROMPTSTR" = x && local PROMPTSTR="${USER}${ESC}[4${BASHISH_COLOR0};3${BASHISH_COLOR1}m@${ESC}[3${BASHISH_COLOR2}m${HOSTNAME%%.*}"

local ROOT="="
test "x${UID}" = x0 && ROOT="#"


## this is messy stuff, cannot comment in code so I comment above
## don't whine if the comments are wrong ;)
PS1="${EMBED}\
${ESC}[2A\
${ESC}[2B\
${ESC}[0m\
${ESC}7\
${ESC}[4${BASHISH_COLOR0};30m\
$FILLY\
${ESC}[0;$(($LINES - 2))r\
${ESC}[$(($LINES - 1));0H\
${ESC}[K\
${ESC}[0m${ESC}[K${ESC}[4${BASHISH_COLOR0};30m  ${ESC}[E\
${ESC}[$(($LINES));0H\
${ESC}[0;3${BASHISH_COLOR0}m`_bashish_prompt_cp437 DF`\
${ESC}[4${BASHISH_COLOR0};30m`_bashish_prompt_fillx \" \" 2`\
${ESC}[0;3${BASHISH_COLOR0}m`_bashish_prompt_cp437 DC`\
${ESC}[$LINES;4H\
${ESC}[4${BASHISH_COLOR0};3${BASHISH_COLOR1}m(\
${ESC}[3${BASHISH_COLOR2}m$PROMPTSTR\
${ESC}[3${BASHISH_COLOR1}m)\
${ESC}[2C(\
${ESC}[3${BASHISH_COLOR2}m${UNEMBED}$BASHISH_CWD${EMBED}${RCS_PS1}\
${ESC}[3${BASHISH_COLOR1}m)\
${ESC}[33m\
${ESC}[$LINES;$(($COLUMNS - 12))H\
${ESC}[3${BASHISH_COLOR1}m(\
${ESC}[3${BASHISH_COLOR2}m${TIME}\
${ESC}[3${BASHISH_COLOR1}m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C\
${ESC}[3${BASHISH_COLOR1}m)\
${ESC}8\
${ESC}[0;4;3${BASHISH_COLOR0}m\
${UNEMBED}\
`_bashish_prompt_cp437 DC`\
${EMBED}\
${ESC}[0;4${BASHISH_COLOR0};3${BASHISH_COLOR1}m\
${UNEMBED} ${ROOT} ${EMBED}\
${ESC}[0;3${BASHISH_COLOR1}m\
${UNEMBED}\
`_bashish_prompt_cp437 C4`<${EMBED}\
${ESC}[0m\
${UNEMBED}\
 "
}
