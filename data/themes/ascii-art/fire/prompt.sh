#!/bin/sh
# Fire
# Created by BadlandZ in v.0.4b
# Adapted by jf
# Changed By Spidey 08/06 Adding Ending brackets \]
# Changed by Arnognulf, converted to Bashish prompt, UTF-8
_bashish_prompt() {
eval $(_bashish_prompt_shellvars $SHELLNAME)
eval $(_bashish_prompt_parsecolors "$@")
test "x${BASHISH_COLOR0}" = x && eval $(_bashish_prompt_parsecolors yellow red)
test "x${BASHISH_COLOR1}" = x && eval $(_bashish_prompt_parsecolors $1 red)
PROMPT_COMMAND="_BASHISH_PROMPT_RCS=\$(_bashish_prompt_rcs \${_BASHISH_PROMPT_RCS} ) && _bashish_promptupdate"

local FADE="`_bashish_prompt_cp437 DB B2 B1 B0`"
local FADE2="`_bashish_prompt_cp437 B0 B1 B2 DB`"
local BASHISH_CWD=`_bashish_prompt_cwd $SHELLNAME "${ESC}[3${BASHISH_COLOR1}m" "${ESC}[3${BASHISH_COLOR0}m" 39`
local RCS_PS1=$(_bashish_prompt_rcs)
test "x${RCS_PS1}" != x && RCS_PS1="${EMBED}${ESC}[3${BASHISH_COLOR1};1m${UNEMBED}(${EMBED}${ESC}[3${BASHISH_COLOR0};1m${UNEMBED}${RCS_PS1}${EMBED}${ESC}[3${BASHISH_COLOR1};1m${UNEMBED})${EMBED}${ESC}[0m${UNEMBED} "
test x${PROMPTSTR} = x && local PROMPTSTR=${USER}@${HOSTNAME%%.*}

local ROOT=""
test "x${UID}" = x0 && ROOT="$EMBED${ESC}[3${BASHISH_COLOR0};1m$UNEMBED#$EMBED${ESC}[0m$UNEMBED "

PS1="${EMBED}${ESC}[01;3${BASHISH_COLOR0};4${BASHISH_COLOR0}m${UNEMBED}$FADE${EMBED}${ESC}[01;37;4${BASHISH_COLOR0}m${UNEMBED}${PROMPTSTR}${EMBED}${ESC}[00;3${BASHISH_COLOR1};4${BASHISH_COLOR0}m${UNEMBED}${FADE2}${EMBED}${ESC}[00;3${BASHISH_COLOR1};40m${UNEMBED}$FADE${EMBED}${ESC}[01;37;40m${UNEMBED} \d
${EMBED}${ESC}[3${BASHISH_COLOR0};40;1m${UNEMBED}${BASHISH_CWD}${EMBED}${ESC}[3${BASHISH_COLOR1}m${UNEMBED}/${EMBED}${ESC}[0m${UNEMBED} ${RCS_PS1}${ROOT}"

PS2="${EMBED}${ESC}[01;33;43m${UNEMBED}$FADE${EMBED}${ESC}[00;31;43m${UNEMBED}$FADE2${EMBED}${ESC}[00;31;40m${UNEMBED}$FADE${EMBED}${ESC}[01;01;31m${UNEMBED}>${EMBED}${ESC}[00m${UNEMBED} "


}
