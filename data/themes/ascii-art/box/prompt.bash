#!/bin/sh
_bashish_prompt ()
{
eval $(_bashish_prompt_shellvars)

test x${LINES} = x && LINES=132
typeset i=0
typeset FILLY=""
test "x${PROMPTSTR}" = x && typeset PROMPTSTR="${USER}${ESC}[3"${MAINCOLOR}"m@${ESC}[9"${MAINCOLOR}"m${HOSTNAME}"
typeset BASHISH_B3="`_bashish_prompt_cp437 B3`"
while test "$i" -lt ${LINES}
do
	FILLY="${FILLY}${ESC}[0G${ESC}[9${MAINCOLOR}m${BASHISH_B3}${ESC}[${COLUMNS}G${ESC}[3"${MAINCOLOR}"m$BASHISH_B3${ESC}[B"
	let i++
done

typeset BASHISH_C0=`_bashish_prompt_cp437 C0`
typeset BASHISH_C4=`_bashish_prompt_cp437 C4`
typeset BASHISH_DA=`_bashish_prompt_cp437 DA`
typeset BASHISH_D9=`_bashish_prompt_cp437 D9`

typeset BASHISH_BF=`_bashish_prompt_cp437 BF`
typeset BASHISH_B3=`_bashish_prompt_cp437 B3`

typeset BASHISH_CWD=`_bashish_prompt_cwd "${ESC}[3${MAINCOLOR}m" "${ESC}[9${MAINCOLOR}m" 43`
PS1="\[\
${ESC}[A\
${ESC}[B\
${ESC}7\
$FILLY\
${ESC}[0;$(($LINES - 1))r\
${ESC}[$LINES;0H\
${ESC}[3${MAINCOLOR}m${BASHISH_C0}`_bashish_prompt_fillx ${BASHISH_C4} 2`${BASHISH_D9}\
${ESC}["$LINES";4H\
${ESC}[3${MAINCOLOR}m[\
${ESC}[9${MAINCOLOR}m${PROMPTSTR}\
${ESC}[3${MAINCOLOR}m]\
${ESC}[2C[\
${ESC}[9${MAINCOLOR}m$BASHISH_CWD\
${ESC}[3${MAINCOLOR}m]\
${ESC}[9${MAINCOLOR}m\
${ESC}[$LINES;$(($COLUMNS - 12))H\
${ESC}[3${MAINCOLOR}m[\
${ESC}[9${MAINCOLOR}m\t\
${ESC}[3${MAINCOLOR}m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C\
${ESC}[3${MAINCOLOR}m]\
${ESC}8\]\
${ESC}[9${MAINCOLOR}m${BASHISH_DA}`_bashish_prompt_fillx ${BASHISH_C4} 2`${BASHISH_BF}
${ESC}[9${MAINCOLOR}m${BASHISH_B3} \[\
${ESC}["$COLUMNS"G\
${ESC}[3${MAINCOLOR}m${BASHISH_B3}\
${ESC}[3G\
${ESC}[0m\]"
#─
PS2=">"
}
_bashish_prompt
