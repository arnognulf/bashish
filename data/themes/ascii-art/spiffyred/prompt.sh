#!/bin/sh
##################################################################################
## Bashish, a console theme engine
## Copyright (C) 2010 Thomas Eriksson
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
test "x${BASHISH_COLOR0}" = x && eval $(_bashish_prompt_parsecolors white)
PROMPT_COMMAND="_BASHISH_PROMPT_RCS=\$(_bashish_prompt_rcs \${_BASHISH_PROMPT_RCS} ) && _bashish_promptupdate"

local RCS_PS1=$(_bashish_prompt_rcs)
test "x${RCS_PS1}" != x && RCS_PS1=" ${EMBED}${ESC}[2;3${BASHISH_COLOR0}m${UNEMBED}${RCS_PS1}${EMBED}${ESC}[0m${UNEMBED}"


local i=0
local FILLY=""
local BASHISH_CWD=`_bashish_prompt_cwd $SHELLNAME "${ESC}[1;3${BASHISH_COLOR0}m" "${ESC}[2m" 39`

test "x$PROMPTSTR" = x && local PROMPTSTR="${USER}${ESC}[4${BASHISH_COLOR0};31m@${ESC}[3${BASHISH_COLOR0}m${HOSTNAME%%.*}"

local ROOT='$'
test "x${UID}" = x0 && ROOT="#"

## this is messy stuff, cannot comment in code so I comment above
## don't whine if the comments are wrong ;)
PS1="${EMBED}${ESC}[1;3${BASHISH_COLOR0}m${UNEMBED}[${EMBED}${ESC}[2m${UNEMBED}${USER}${EMBED}${ESC}[1;3${BASHISH_COLOR}m${UNEMBED}@${EMBED}${ESC}[2m${UNEMBED}$HOSTNAME ${BASHISH_CWD}${RCS_PS1}${EMBED}${ESC}[1;3${BASHISH_COLOR0}m${UNEMBED}]${ROOT}${EMBED}${ESC}[0m${UNEMBED} "
}
_bashish_prompt
