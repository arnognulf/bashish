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
eval $(_bashish_prompt_shellvars $SHELLNAME)
eval $(_bashish_prompt_parsecolors "$@")
test "x${BASHISH_COLOR0}" = x && eval $(_bashish_prompt_parsecolors white)

$_typeset GIT_PS1=$(__git_ps1 "%s" 2>/dev/null)
test "x${GIT_PS1}" != x && GIT_PS1="${EMBED}${ESC}[1;3${BASHISH_COLOR0}m${UNEMBED}|${EMBED}${ESC}[2;3${BASHISH_COLOR0}m${UNEMBED}${GIT_PS1}${EMBED}${ESC}[0m${UNEMBED}"

$_typeset i=0
$_typeset FILLY=""
$_typeset BASHISH_CWD=`_bashish_prompt_cwd "\\[\033[1;3${BASHISH_COLOR0}m\\]" "\\[\033[2m\\]" 39`

test "x$PROMPTSTR" = x && typeset PROMPTSTR="${USER}${ESC}[4${BASHISH_COLOR0};31m@${ESC}[3${BASHISH_COLOR0}m${HOSTNAME}"

$_typeset ROOT='$'
test "x${UID}" = x0 && ROOT="#"
## this is messy stuff, cannot comment in code so I comment above
## don't whine if the comments are wrong ;)
PS1="${EMBED}${ESC}[1;3${BASHISH_COLOR0}m${UNEMBED}${USER}${EMBED}${ESC}[2m${UNEMBED}@${EMBED}${ESC}[1;3${BASHISH_COLOR0}m${UNEMBED}$HOSTNAME${EMBED}${ESC}[2m${UNEMBED}:${BASHISH_CWD}${EMBED}${ESC}[1;3${BASHISH_COLOR0}m${UNEMBED}${GIT_PS1}${ROOT}${EMBED}${ESC}[0m${UNEMBED} "
}
_bashish_prompt
