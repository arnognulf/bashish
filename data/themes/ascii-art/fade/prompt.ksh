# Blue
# Created by BadlandZ in v.0.4b
# Adapted by jf
# Changed By Spidey 08/06 Adding Ending brackets \]
# Changed by Arnognulf, converted to Bashish prompt, UTF-8 / CP437



_bashish_prompt () {
eval _bashish_prompt_shellvars

## load some compat variables, TIME, DATE, BEGIN_HIDE, END_HIDE etc
#eval $(_bashish_shellcompat)

typeset HIDE="\\["
typeset UNHIDE="\\]"
typeset FADE="`_bashish_prompt_cp437 DB B2 B1 B0`"
typeset ESC=""
typeset TIME="\t"
typeset DATE="\d"

PS1="${HIDE}${ESC}[40m${UNHIDE}`_bashish_prompt_fillx \" \"`${HIDE}${ESC}[0G${ESC}[3${MAINCOLOR};4${MAINCOLOR};1m${UNHIDE}$FADE${HIDE}${ESC}[37;4${MAINCOLOR};1m${UNHIDE}${USER}@${HOSTNAME}${HIDE}${ESC}[0m${UNHIDE}${HIDE}${ESC}[3${MAINCOLOR};40m${UNHIDE}$FADE${HIDE}${ESC}[37;40;1m${UNHIDE} ${DATE} ${TIME}${ESC}[9${MAINCOLOR}m${ESC}[6D:${ESC}[2C:${ESC}[2C\033[0m
${HIDE}${ESC}[3${MAINCOLOR};1m${UNHIDE}"`_bashish_prompt_cwd "${HIDE}\033[0;3${MAINCOLOR}m${UNHIDE}" "${HIDE}\033[3${MAINCOLOR};1m${UNHIDE}" \`expr $COLUMNS / 2\``"/${HIDE}${ESC}[0m${UNHIDE} "
PS2="${HIDE}${ESC}[3${MAINCOLOR};40m${UNHIDE}$FADE${HIDE}${ESC}[0m${UNHIDE}>"
}

_bashish_prompt
