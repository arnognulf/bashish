#!/bin/sh
# Blue
# Created by BadlandZ in v.0.4b
# Adapted by jf
# Changed By Spidey 08/06 Adding Ending brackets \]
# Changed by Arnognulf, converted to Bashish prompt, UTF-8 / CP437

_bashish_prompt () {
## load some compat variables, TIME, DATE, BEGIN_HIDE, END_HIDE etc
eval $(_bashish_prompt_shellvars $SHELLNAME)
eval $(_bashish_prompt_parsecolors "$@")
test "x${BASHISH_COLOR0}" = x && eval $(_bashish_prompt_parsecolors blue)

case "$TERM" in
linux) local FADE="`_bashish_prompt_cp437 DB B1 B0`"" ";;
*) local FADE="`_bashish_prompt_cp437 DB B2 B1 B0`";;
esac
test "x${PROMPTSTR}" = x && local PROMPTSTR=${USER}@${HOSTNAME%%.*}
PROMPT_COMMAND="_BASHISH_PROMPT_RCS=\$(_bashish_prompt_rcs \${_BASHISH_PROMPT_RCS} ) && _bashish_promptupdate"

local RCS_PS1=$(_bashish_prompt_rcs)
test "x${RCS_PS1}" != x && RCS_PS1="${EMBED}${ESC}[0;${NORMAL};${FG}${BASHISH_COLOR0};2m${UNEMBED}(${EMBED}${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0};${BOLD}m${UNEMBED}${RCS_PS1}${EMBED}${ESC}[0;${NORMAL};${FG}${BASHISH_COLOR0};2m${UNEMBED})${EMBED}${ESC}[0m${UNEMBED} "
local ROOT=""
test "x${UID}" = x0 && ROOT="$EMBED${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0};${BOLD}m$UNEMBED#$EMBED${ESC}[0m$UNEMBED "

PS1="\
${ESC}[0G\
${ESC}[40m`_bashish_prompt_fillx \" \"`\
${ESC}[0G\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0};${BG}${BASHISH_COLOR0};${BOLD}m$FADE\
${ESC}[${NORMAL};${BRIGHTFG}7;${BG}${BASHISH_COLOR0};${BOLD}m ${PROMPTSTR}\
${ESC}[0m\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0};${BG}0m$FADE\
${ESC}[${NORMAL};${BRIGHTFG}7;${BG}0;${BOLD}m ${DATE} ${TIME}\
${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0}m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C${ESC}[0m
${EMBED}${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0};${BOLD}m${UNEMBED}"`_bashish_prompt_cwd $SHELLNAME "${ESC}[0;${NORMAL};${FG}${BASHISH_COLOR0}m" "${ESC}[${NORMAL};${BRIGHTFG}${BASHISH_COLOR0};${BOLD}m" \`expr $COLUMNS / 2\``"${EMBED}${ESC}[0;${NORMAL};${FG}${BASHISH_COLOR0}m${UNEMBED}/${EMBED}\
${ESC}[0m${UNEMBED} ${RCS_PS1}${ROOT}"

PS2="${EMBED}\
${ESC}[${NORMAL};${FG}${BASHISH_COLOR0};${BG}0m${UNEMBED}$FADE${EMBED}\
${ESC}[0m${UNEMBED}> "
}
