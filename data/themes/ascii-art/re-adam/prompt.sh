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
local LINE=`_bashish_prompt_fillx ─ `

test "x${PROMPTSTR}" = x && local PROMPTSTR="$USER${ESC}[${BRIGHTFG}${BASHISH_COLOR0}m@${ESC}[3${BASHISH_COLOR0}m${HOSTNAME%%.*}"
local PROMPTSTR_SANE="${USER}@${HOSTNAME%%.*}"
## Mac OS X needs it's wrap arond turned off for bashish to print the spiffy prompts
## correctly

case "$SHELLNAME" in
bash|zsh)
PS1="\
${LINE}${ESC}[${COLUMNS}D╭─(~/Kod/bashprompt-0.4.5b6/themes)${ESC}[${COLUMNS}C${ESC}[${#PROMPTSTR_SANE}D${ESC}[6D(${PROMPTSTR})────╮
${EMBED}${ESC}[${COLUMNS}C${ESC}[3D←──╯${ESC}[${COLUMNS}D${ESC}[0m${UNEMBED}╰──→ "
PS1="\
${LINE}${ESC}[${COLUMNS}D╭(~/Kod/bashprompt-0.4.5b6/themes)${ESC}[${COLUMNS}C${ESC}[${#PROMPTSTR_SANE}D${ESC}[6D(${PROMPTSTR})────→
${EMBED}${ESC}[0m${UNEMBED}╰→ "

esac
}
