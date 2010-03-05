#!/bin/sh
# Created by KrON from windowmaker on IRC
# Changed by Spidey 08/06
# converted to bashish, and updated by arno
# stolen from the now defunct bashprompt project:
# now found at http://cygutils.fruitbat.org/bashprompt/index.html
# originally http://web.archive.org/web/20010406040532/bash.current.nu/themes.html

_bashish_prompt () {
eval $(_bashish_prompt_shellvars "$SHELLNAME")
eval $(_bashish_prompt_parsecolors "$@")
test "x$BASHISH_COLOR0" = x && eval $(_bashish_prompt_parsecolors blue red)
test "x$BASHISH_COLOR1" = x && eval $(_bashish_prompt_parsecolors "$1" red)

$_typeset BASHISH_DA=`_bashish_prompt_cp437 DA` # ┌
$_typeset BASHISH_C0=`_bashish_prompt_cp437 C0` # └
$_typeset BASHISH_C4=`_bashish_prompt_cp437 C4` # ─
$_typeset BASHISH_F9=`_bashish_prompt_cp437 F9` # ∙
$_typeset BASHISH_FA=`_bashish_prompt_cp437 FA` # ·
test "x$PROMPTSTR" = x && $_typeset PROMPTSTR="${USER}${ESC}[3${BASHISH_COLOR0}m@${ESC}[3${BASHISH_COLOR1}m${HOSTNAME%%.*}"

PS1="${ESC}[3${BASHISH_COLOR1}m${BASHISH_DA}${BASHISH_C4}\
${ESC}[3${BASHISH_COLOR0}m(${ESC}[3${BASHISH_COLOR1}m${PROMPTSTR}${ESC}[3${BASHISH_COLOR0}m)\
${ESC}[3${BASHISH_COLOR1}m-\
${ESC}[3${BASHISH_COLOR0}m(\
${ESC}[3${BASHISH_COLOR1}m${TIME}\
${ESC}[3${BASHISH_COLOR0}m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C\
${ESC}[3${BASHISH_COLOR0}m-:-\
${ESC}[3${BASHISH_COLOR1}m$(date +%d/%m)\
${ESC}[3${BASHISH_COLOR0}m\
${ESC}[3D/\
${ESC}[2C\
${ESC}[3${BASHISH_COLOR0}m)\
${ESC}[3${BASHISH_COLOR1}m${BASHISH_C4}-\
${ESC}[3${BASHISH_COLOR0}m]${BASHISH_F9}\
${ESC}[3${BASHISH_COLOR1}m-${BASHISH_F9}${BASHISH_F9}\
${ESC}[3${BASHISH_COLOR0}m${BASHISH_FA}
${EMBED}${ESC}[3${BASHISH_COLOR1}m${UNEMBED}${BASHISH_C0}${BASHISH_C4}\
${EMBED}${ESC}[3${BASHISH_COLOR0}m${UNEMBED}(\
${EMBED}${ESC}[3${BASHISH_COLOR1}m${UNEMBED}${PWD##*/}\
${EMBED}${ESC}[3${BASHISH_COLOR0}m${UNEMBED})\
${EMBED}${ESC}[3${BASHISH_COLOR1}m${UNEMBED}${BASHISH_C4}${BASHISH_F9}\
${EMBED}${ESC}[3${BASHISH_COLOR0}m${UNEMBED}${BASHISH_FA}\
${EMBED}${ESC}[0m${UNEMBED} "
}
