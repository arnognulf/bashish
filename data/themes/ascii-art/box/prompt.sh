#!/bin/sh
_bashish_prompt ()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
eval $(_bashish_prompt_parsecolors "$@")
test "x${BASHISH_COLOR0}" = x && eval $(_bashish_prompt_parsecolors blue)
$_typeset GIT_PS1=$(__git_ps1 "%s" 2>/dev/null)
test "x${GIT_PS1}" != x && GIT_PS1="${ESC}[0;3${BASHISH_COLOR0}m|${ESC}[1;3${BASHISH_COLOR0}m${GIT_PS1}${ESC}[0;3${BASHISH_COLOR0}m"

test x${LINES} = x && LINES=132
$_typeset i=0
$_typeset FILLY=""
test "x${PROMPTSTR}" = x && $_typeset PROMPTSTR="${USER}${ESC}[3"${BASHISH_COLOR0}"m@${ESC}[9"${BASHISH_COLOR0}"m${HOSTNAME%%.*}"
$_typeset BASHISH_B3="`_bashish_prompt_cp437 B3`"
while test "$i" -lt ${LINES}
do
	FILLY="${FILLY}${ESC}[0G${ESC}[9${BASHISH_COLOR0}m${BASHISH_B3}${ESC}[${COLUMNS}G${ESC}[3"${BASHISH_COLOR0}"m$BASHISH_B3${ESC}[B"
	let i++
done

$_typeset BASHISH_C0=`_bashish_prompt_cp437 C0` # └
$_typeset BASHISH_C4=`_bashish_prompt_cp437 C4` # ─
$_typeset BASHISH_DA=`_bashish_prompt_cp437 DA` # ┌
$_typeset BASHISH_D9=`_bashish_prompt_cp437 D9` # ┘
$_typeset BASHISH_BF=`_bashish_prompt_cp437 BF` # ┐
$_typeset BASHISH_B3=`_bashish_prompt_cp437 B3` # │

$_typeset BASHISH_CWD=`_bashish_prompt_cwd "${ESC}[3${BASHISH_COLOR0}m" "${ESC}[9${BASHISH_COLOR0}m" 43`
case "${UID}" in
0)
PS1="${EMBED}\
${ESC}[A\
${ESC}[B\
${ESC}7\
$FILLY\
${ESC}[0;$(($LINES - 1))r\
${ESC}[$LINES;0H\
${ESC}[3${BASHISH_COLOR0}m${BASHISH_C0}`_bashish_prompt_fillx ${BASHISH_C4} 2`${BASHISH_D9}\
${ESC}["$LINES";4H\
${ESC}[3${BASHISH_COLOR0}m[\
${ESC}[9${BASHISH_COLOR0}m${PROMPTSTR}\
${ESC}[3${BASHISH_COLOR0}m]\
${ESC}[2C[\
${ESC}[9${BASHISH_COLOR0}m$BASHISH_CWD${GIT_PS1}\
${ESC}[3${BASHISH_COLOR0}m]\
${ESC}[9${BASHISH_COLOR0}m\
${ESC}[$LINES;$(($COLUMNS - 12))H\
${ESC}[3${BASHISH_COLOR0}m[\
${ESC}[9${BASHISH_COLOR0}m\t\
${ESC}[3${BASHISH_COLOR0}m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C\
${ESC}[3${BASHISH_COLOR0}m]\
${ESC}8${UNEMBED}\
${ESC}[9${BASHISH_COLOR0}m# ${BASHISH_DA}`_bashish_prompt_fillx ${BASHISH_C4} 4`${BASHISH_BF}
${ESC}[9${BASHISH_COLOR0}m${BASHISH_DA}${BASHISH_C4}${BASHISH_D9} ${EMBED}\
${ESC}["$COLUMNS"G\
${ESC}[3${BASHISH_COLOR0}m${BASHISH_B3}\
${ESC}[5G\
${ESC}[0m${UNEMBED}"

;;
*)
PS1="${EMBED}\
${ESC}[A\
${ESC}[B\
${ESC}7\
$FILLY\
${ESC}[0;$(($LINES - 1))r\
${ESC}[$LINES;0H\
${ESC}[3${BASHISH_COLOR0}m${BASHISH_C0}`_bashish_prompt_fillx ${BASHISH_C4} 2`${BASHISH_D9}\
${ESC}["$LINES";4H\
${ESC}[3${BASHISH_COLOR0}m[\
${ESC}[9${BASHISH_COLOR0}m${PROMPTSTR}\
${ESC}[3${BASHISH_COLOR0}m]\
${ESC}[2C[\
${ESC}[9${BASHISH_COLOR0}m$BASHISH_CWD${GIT_PS1}\
${ESC}[3${BASHISH_COLOR0}m]\
${ESC}[9${BASHISH_COLOR0}m\
${ESC}[$LINES;$(($COLUMNS - 12))H\
${ESC}[3${BASHISH_COLOR0}m[\
${ESC}[9${BASHISH_COLOR0}m\t\
${ESC}[3${BASHISH_COLOR0}m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C\
${ESC}[3${BASHISH_COLOR0}m]\
${ESC}8${UNEMBED}\
${ESC}[9${BASHISH_COLOR0}m${BASHISH_DA}`_bashish_prompt_fillx ${BASHISH_C4} 2`${BASHISH_BF}
${ESC}[9${BASHISH_COLOR0}m${BASHISH_B3} ${EMBED}\
${ESC}["$COLUMNS"G\
${ESC}[3${BASHISH_COLOR0}m${BASHISH_B3}\
${ESC}[3G\
${ESC}[0m${UNEMBED}"
esac
#─
PS2=">"
}
