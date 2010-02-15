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
TITLE="( $USER @ $HOSTNAME )"


typeset i=0
typeset FILLY=""
typeset BASHISH_CWD=`_bashish_prompt_cwd "${ESC}[31m" "${ESC}[37m" 39`

eval $(_bashish_prompt_shellvars $SHELLNAME)

while test "$i" -lt $(($LINES))
do
	FILLY="$FILLY  ${ESC}[E"
	let i++
done

test "x$PROMPTSTR" = x && typeset PROMPTSTR="${USER}${ESC}[42;31m@${ESC}[37m${HOSTNAME}"

## this is messy stuff, cannot comment in code so I comment above
## don't whine if the comments are wrong ;)
PS1="${EMBED}\
${ESC}[2A\
${ESC}[2B\
${ESC}[0m\
${ESC}7\
${ESC}[42;30m\
$FILLY\
${ESC}[0;$(($LINES - 2))r\
${ESC}[$(($LINES - 1));0H\
${ESC}[0m${ESC}[K${ESC}[42;30m  ${ESC}[E\
${ESC}[$(($LINES));0H\
${ESC}[0;32m`_bashish_prompt_cp437 DF`\
${ESC}[42;30m`_bashish_prompt_fillx \" \" 2`\
${ESC}[0;32m`_bashish_prompt_cp437 DC`\
${ESC}[$LINES;4H\
${ESC}[42;31m(\
${ESC}[37m$PROMPTSTR\
${ESC}[31m)\
${ESC}[2C(\
${ESC}[37m$BASHISH_CWD\
${ESC}[31m)\
${ESC}[33m\
${ESC}[$LINES;$(($COLUMNS - 12))H\
${ESC}[31m(\
${ESC}[37m\t\
${ESC}[31m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C\
${ESC}[31m)\
${ESC}8\
${ESC}[0;4;32m\
${UNEMBED}\
`_bashish_prompt_cp437 DC`\
${EMBED}\
${ESC}[0;42;31m\
${UNEMBED} = ${EMBED}\
${ESC}[0;31m\
${UNEMBED}\
`_bashish_prompt_cp437 C4`<${EMBED}\
${ESC}[0m\
${UNEMBED}\
 "
}
_bashish_prompt
