#!/bin/sh
##################################################################################
## Copyright (c) 2010, Thomas Eriksson
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
PROMPT_COMMAND="_BASHISH_PROMPT_RCS=\$(_bashish_prompt_rcs \${_BASHISH_PROMPT_RCS} ) && _bashish_promptupdate"
local RCS_PS1=$(_bashish_prompt_rcs)
test "x${RCS_PS1}" != x && RCS_PS1="${ESC}[3${BASHISH_COLOR0};1m|${ESC}[0;3${BASHISH_COLOR0}m${RCS_PS1}"
local ROOT=">"
test "x${UID}" = x0 && ROOT="#"
local FADE1="${ESC}[32m"
local BASHISH_C4=`_bashish_prompt_cp437 C4`
local BASHISH_DA=`_bashish_prompt_cp437 DA`
local BASHISH_C0=`_bashish_prompt_cp437 C0`
local LINE=`_bashish_prompt_fillx $BASHISH_C4`

test "x${PROMPTSTR}" = x && local PROMPTSTR="$USER${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m@${ESC}[3${BASHISH_COLOR0}m${HOSTNAME%%.*}"

## Mac OS X needs it's wrap arond turned off for bashish to print the spiffy prompts
## correctly

case "$SHELLNAME" in
bash|zsh)
PS1="\
${ESC}[?7l\
${ESC}[${COLUMNS}D\
${ESC}[3${BASHISH_COLOR0}m$LINE\
${ESC}[${COLUMNS}D\
${ESC}[37m$BASHISH_DA$BASHISH_C4\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m$BASHISH_C4\
${ESC}[3${BASHISH_COLOR0}m$BASHISH_C4\
${ESC}[${BRIGHTFG}0m$BASHISH_C4\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m[\
${ESC}[3${BASHISH_COLOR0}m$PROMPTSTR\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m]\
${ESC}[${BRIGHTFG}0m$BASHISH_C4$BASHISH_C4\
${ESC}[3${BASHISH_COLOR0}m${BASHISH_C4}\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m${BASHISH_C4}\
${ESC}[37m${BASHISH_C4}${BASHISH_C4}\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m${BASHISH_C4}\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m[\
${ESC}[3${BASHISH_COLOR0}m$TIME\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C]\
${ESC}[${BRIGHTFG}0m${BASHISH_C4}${BASHISH_C4}\
${ESC}[3${BASHISH_COLOR0}m${BASHISH_C4}\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m${BASHISH_C4}\
${ESC}[37m${BASHISH_C4}${BASHISH_C4}\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m${BASHISH_C4}\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m["`_bashish_prompt_cwd $SHELLNAME "\
${ESC}[${BRIGHTFG}"${BASHISH_COLOR0}"m" "\
${ESC}[3"${BASHISH_COLOR0}"m" 58`"${RCS_PS1}\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m]\
${ESC}[${BRIGHTFG}0m$BASHISH_C4$BASHISH_C4\
${ESC}[3${BASHISH_COLOR0}m$BASHISH_C4\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m$BASHISH_C4\
${ESC}[37m$BASHISH_C4$BASHISH_C4\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m$BASHISH_C4$BASHISH_C4${ESC}[0m
${EMBED}${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m${UNEMBED}$BASHISH_C0\
${EMBED}${ESC}[3${BASHISH_COLOR0}m${UNEMBED}$BASHISH_C4\
${EMBED}${ESC}[${BRIGHTFG}0m${UNEMBED}$BASHISH_C4\
${EMBED}${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m${UNEMBED}${ROOT}\
${EMBED}${ESC}[?7h${ESC}[0m${UNEMBED} "
;;
*)
## the ksh/sh prompt differs a bit from the one above, since it uses a hack to get around the embedding of terminal control sequences
PS1="
\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m${BASHISH_C0}\
${ESC}[3${BASHISH_COLOR0}m$LINE\
${ESC}[${BRIGHTFG}0m$LINE\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m${ROOT}\
${ESC}[A\
${ESC}[4D\
${ESC}[3${BASHISH_COLOR0}m`_bashish_prompt_fillx $LINE`\
${ESC}["$COLUMNS"D\
${ESC}[37m${BASHISH_DA}$LINE\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m$LINE\
${ESC}[3${BASHISH_COLOR0}m$LINE\
${ESC}[${BRIGHTFG}0m$LINE\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m[\
${ESC}[3${BASHISH_COLOR0}m""$USER\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m""@\
${ESC}[3${BASHISH_COLOR0}m""${HOSTNAME%%.*}\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m]\
${ESC}[${BRIGHTFG}0m$LINE$LINE\
${ESC}[3${BASHISH_COLOR0}m─\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m─\
${ESC}[37m──\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m─\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m[\
${ESC}[3${BASHISH_COLOR0}m$TIME\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C]\
${ESC}[${BRIGHTFG}0m──\
${ESC}[3${BASHISH_COLOR0}m─\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m─\
${ESC}[37m──\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m─\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m["`_bashish_prompt_cwd $SHELLNAME "${RCS_PS1}\
${ESC}[${BRIGHTFG}"${BASHISH_COLOR0}"m" "\
${ESC}[3"${BASHISH_COLOR0}"m" 58`"\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m]\
${ESC}[${BRIGHTFG}0m$LINE$LINE\
${ESC}[3${BASHISH_COLOR0}m$LINE\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m$LINE\
${ESC}[37m$LINE$LINE\
${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m$LINE$LINE\
${ESC}[0m
${ESC}[4C "

esac
}
