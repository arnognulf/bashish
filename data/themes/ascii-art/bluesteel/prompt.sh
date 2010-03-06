#!/bin/sh
##################################################################################
## Copyright (c) 2006, Thomas Eriksson
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without 
## modification, are permitted provided that the following conditions 
## are met:
##
## * Redistributions of source code must retain the above copyright notice, 
##   this list of conditions and the following disclaimer.
## * Redistributions in binary form must reproduce the above copyright notice,
##   this list of conditions and the following disclaimer in the documentation
##   and/or other materials provided with the distribution.
## * Neither the name of the Bashish project nor the names of its contributors 
##   may be used to endorse or promote products derived from this software 
##   without specific prior written permission.
##
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
## AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
## IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
## ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
## LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
## CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
## SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
## INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
## CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
## ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF 
## THE POSSIBILITY OF SUCH DAMAGE.
##
##################################################################################
##
## Bluesteel by arnognulf
##
###########################

## mash up this function to not use bash string manipulation
## if DIRELEMENT1 = PWDELEM1
_bashish_prompt ()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
eval $(_bashish_prompt_parsecolors "$@")
test "x${BASHISH_COLOR0}" = x && eval $(_bashish_prompt_parsecolors blue)
$_typeset RCS_PS1=$(_bashish_prompt_rcs)
test "x${RCS_PS1}" != x && RCS_PS1="${ESC}[3${BASHISH_COLOR0};1m|${ESC}[0;3${BASHISH_COLOR0}m${RCS_PS1}"
$_typeset ROOT=">"
test "x${UID}" = x0 && ROOT="#"
$_typeset FADE1="${ESC}[32m"
$_typeset BASHISH_C4=`_bashish_prompt_cp437 C4`
$_typeset BASHISH_DA=`_bashish_prompt_cp437 DA`
$_typeset BASHISH_C0=`_bashish_prompt_cp437 C0`
$_typeset LINE=`_bashish_prompt_fillx $BASHISH_C4`

test "x${PROMPTSTR}" = x && $_typeset PROMPTSTR="$USER${ESC}[9${BASHISH_COLOR0}m@${ESC}[3${BASHISH_COLOR0}m${HOSTNAME%%.*}"

case "$SHELLNAME" in
bash|zsh)
PS1="\
${ESC}[3${BASHISH_COLOR0}m$LINE${ESC}["$COLUMNS"D${ESC}[37m$BASHISH_DA$BASHISH_C4${ESC}[9${BASHISH_COLOR0}m$BASHISH_C4${ESC}[3${BASHISH_COLOR0}m$BASHISH_C4${ESC}[90m$BASHISH_C4${ESC}[9${BASHISH_COLOR0}m[${ESC}[3${BASHISH_COLOR0}m$PROMPTSTR${ESC}[9${BASHISH_COLOR0}m]${ESC}[90m$BASHISH_C4$BASHISH_C4${ESC}[3${BASHISH_COLOR0}m${BASHISH_C4}${ESC}[9${BASHISH_COLOR0}m${BASHISH_C4}${ESC}[37m${BASHISH_C4}${BASHISH_C4}${ESC}[9${BASHISH_COLOR0}m${BASHISH_C4}${ESC}[9${BASHISH_COLOR0}m[${ESC}[3${BASHISH_COLOR0}m$TIME${ESC}[9${BASHISH_COLOR0}m${ESC}[6D:${ESC}[2C:${ESC}[2C]${ESC}[90m${BASHISH_C4}${BASHISH_C4}${ESC}[3${BASHISH_COLOR0}m${BASHISH_C4}${ESC}[9${BASHISH_COLOR0}m${BASHISH_C4}${ESC}[37m${BASHISH_C4}${BASHISH_C4}${ESC}[9${BASHISH_COLOR0}m${BASHISH_C4}${ESC}[9${BASHISH_COLOR0}m["`_bashish_prompt_cwd "${EMBED}${ESC}[9"${BASHISH_COLOR0}"m${UNEMBED}" "${EMBED}${ESC}[3"${BASHISH_COLOR0}"m${UNEMBED}" 58`"${RCS_PS1}${ESC}[9${BASHISH_COLOR0}m]${ESC}[90m$BASHISH_C4$BASHISH_C4${ESC}[3${BASHISH_COLOR0}m$BASHISH_C4${ESC}[9${BASHISH_COLOR0}m$BASHISH_C4${ESC}[37m$BASHISH_C4$BASHISH_C4${ESC}[9${BASHISH_COLOR0}m$BASHISH_C4$BASHISH_C4${ESC}[0m
${EMBED}${ESC}[9${BASHISH_COLOR0}m${UNEMBED}$BASHISH_C0${EMBED}${ESC}[3${BASHISH_COLOR0}m${UNEMBED}$BASHISH_C4${EMBED}${ESC}[90m${UNEMBED}$BASHISH_C4${EMBED}${ESC}[9${BASHISH_COLOR0}m${UNEMBED}${ROOT}${EMBED}${ESC}[0m${UNEMBED} "
;;
*)
## the ksh/sh prompt differs a bit from the one above, since it uses a hack to get around the embedding of terminal control sequences
PS1="
${ESC}[9${BASHISH_COLOR0}m${BASHISH_C0}${ESC}[3${BASHISH_COLOR0}m$LINE${ESC}[90m$LINE${ESC}[9${BASHISH_COLOR0}m${ROOT}${ESC}[A${ESC}[4D${ESC}[3${BASHISH_COLOR0}m`_bashish_prompt_fillx $LINE`${ESC}["$COLUMNS"D${ESC}[37m${BASHISH_DA}$LINE${ESC}[9${BASHISH_COLOR0}m$LINE${ESC}[3${BASHISH_COLOR0}m$LINE${ESC}[90m$LINE${ESC}[9${BASHISH_COLOR0}m[${ESC}[3${BASHISH_COLOR0}m""$USER${ESC}[9${BASHISH_COLOR0}m""@${ESC}[3${BASHISH_COLOR0}m""${HOSTNAME%%.*}${ESC}[9${BASHISH_COLOR0}m]${ESC}[90m$LINE$LINE${ESC}[3${BASHISH_COLOR0}m─${ESC}[9${BASHISH_COLOR0}m─${ESC}[37m──${ESC}[9${BASHISH_COLOR0}m─${ESC}[9${BASHISH_COLOR0}m[${ESC}[3${BASHISH_COLOR0}m$TIME${ESC}[9${BASHISH_COLOR0}m${ESC}[6D:${ESC}[2C:${ESC}[2C]${ESC}[90m──${ESC}[3${BASHISH_COLOR0}m─${ESC}[9${BASHISH_COLOR0}m─${ESC}[37m──${ESC}[9${BASHISH_COLOR0}m─${ESC}[9${BASHISH_COLOR0}m["`_bashish_prompt_cwd "${RCS_PS1}${ESC}[9"${BASHISH_COLOR0}"m" "${ESC}[3"${BASHISH_COLOR0}"m" 58`"${ESC}[9${BASHISH_COLOR0}m]${ESC}[90m$LINE$LINE${ESC}[3${BASHISH_COLOR0}m$LINE${ESC}[9${BASHISH_COLOR0}m$LINE${ESC}[37m$LINE$LINE${ESC}[9${BASHISH_COLOR0}m$LINE$LINE${ESC}[0m
${ESC}[4C "

esac
}
