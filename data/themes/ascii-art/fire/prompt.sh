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

$_typeset FADE="`_bashish_prompt_cp437 DB B2 B1 B0`"
$_typeset FADE2="`_bashish_prompt_cp437 B0 B1 B2 DB`"
$_typeset BASHISH_CWD=`_bashish_prompt_cwd "\\[${ESC}[3${BASHISH_COLOR1}m\\]" "\\[${ESC}[3${BASHISH_COLOR0}m\\]" 39`
$_typeset GIT_PS1=$(__git_ps1 "%s" 2>/dev/null)
test "x${GIT_PS1}" != x && GIT_PS1="${EMBED}${ESC}[3${BASHISH_COLOR1};1m${UNEMBED}(${EMBED}${ESC}[3${BASHISH_COLOR0};1m${UNEMBED}${GIT_PS1}${EMBED}${ESC}[3${BASHISH_COLOR1};1m${UNEMBED})${EMBED}${ESC}[0m${UNEMBED} "
test x${PROMPTSTR} = x && $_typeset PROMPTSTR=${USER}@${HOSTNAME}

$_typeset ROOT=""
test "x${UID}" = x0 && ROOT="$EMBED${ESC}[3${BASHISH_COLOR0};1m$UNEMBED#$EMBED${ESC}[0m$UNEMBED "

PS1="${EMBED}${ESC}[01;3${BASHISH_COLOR0};4${BASHISH_COLOR0}m${UNEMBED}$FADE${EMBED}${ESC}[01;37;4${BASHISH_COLOR0}m${UNEMBED}${PROMPTSTR}${EMBED}${ESC}[00;3${BASHISH_COLOR1};4${BASHISH_COLOR0}m${UNEMBED}${FADE2}${EMBED}${ESC}[00;3${BASHISH_COLOR1};40m${UNEMBED}$FADE${EMBED}${ESC}[01;37;40m${UNEMBED} \d
${EMBED}${ESC}[3${BASHISH_COLOR0};40;1m${UNEMBED}${BASHISH_CWD}/${EMBED}${ESC}[0m${UNEMBED} ${GIT_PS1}${ROOT}"

PS2="${EMBED}${ESC}[01;33;43m${UNEMBED}$FADE${EMBED}${ESC}[00;31;43m${UNEMBED}$FADE2${EMBED}${ESC}[00;31;40m${UNEMBED}$FADE${EMBED}${ESC}[01;01;31m${UNEMBED}>${EMBED}${ESC}[00m${UNEMBED} "


}
