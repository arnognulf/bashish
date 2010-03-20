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
test "x${BASHISH_COLOR0}" = x && eval $(_bashish_prompt_parsecolors white white)
test "x${BASHISH_COLOR1}" = x && eval $(_bashish_prompt_parsecolors white white)


PROMPT_COMMAND="_BASHISH_PROMPT_RCS=\$(_bashish_prompt_rcs \${_BASHISH_PROMPT_RCS} ) && _bashish_promptupdate"
case "$TERM" in
linux)
local SPIFFYDULL="${EMBED}${ESC}[${NORMAL};${FG}${BASHISH_COLOR1}m${UNEMBED}"
local SPIFFYNORMAL="${EMBED}${ESC}[${BOLD};${FG}${BASHISH_COLOR0}m${UNEMBED}"
local SPIFFYDULL_NOEMBED="${ESC}[${NORMAL};${FG}${BASHISH_COLOR1}m"
local SPIFFYNORMAL_NOEMBED="${ESC}[${BOLD};${FG}${BASHISH_COLOR0}m"

;;
*)
local SPIFFYDULL="${EMBED}${ESC}[${DULL};${FG}${BASHISH_COLOR1}m${UNEMBED}"
local SPIFFYNORMAL="${EMBED}${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m${UNEMBED}"
local SPIFFYDULL_NOEMBED="${ESC}[${DULL};${FG}${BASHISH_COLOR1}m"
local SPIFFYNORMAL_NOEMBED="${ESC}[${NORMAL};${FG}${BASHISH_COLOR0}m"
esac

case "$TERM_PROGRAM" in
"Apple_Terminal")
local SPIFFYDULL="${EMBED}${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR1}m${UNEMBED}"
local SPIFFYNORMAL="${EMBED}${ESC}[${FG}${BASHISH_COLOR0}m${UNEMBED}"
local SPIFFYDULL_NOEMBED="${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR1}m"
local SPIFFYNORMAL_NOEMBED="${ESC}[${FG}${BASHISH_COLOR0}m"
esac

local SPIFFYNONE="${EMBED}${ESC}[0m${UNEMBED}"


local RCS_PS1=$(_bashish_prompt_rcs)
test "x${RCS_PS1}" != x && RCS_PS1="${SPIFFYNORMAL}|${SPIFFYDULL}${RCS_PS1}${SPIFFYNORMAL}"

local i=0
local FILLY=""
local BASHISH_CWD=`_bashish_prompt_cwd $SHELLNAME "${SPIFFYNORMAL_NOEMBED}" "${SPIFFYDULL_NOEMBED}" 39`

test "x$PROMPTSTR" = x && local PROMPTSTR="${USER}${SPIFFYDULL}@${SPIFFYNORMAL}${HOSTNAME%%.*}"

local ROOT='$'
test "x${UID}" = x0 && ROOT="#"
## this is messy stuff, cannot comment in code so I comment above
## don't whine if the comments are wrong ;)
PS1="${SPIFFYNORMAL}${PROMPTSTR}${SPIFFYDULL}:${BASHISH_CWD}${SPIFFYNORMAL}${RCS_PS1}${ROOT}${SPIFFYNONE} "
}
_bashish_prompt
