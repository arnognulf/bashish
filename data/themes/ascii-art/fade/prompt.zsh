# Blue
# Created by BadlandZ in v.0.4b
# Adapted by jf
# Changed By Spidey 08/06 Adding Ending brackets \]
# Changed by Arnognulf, converted to Bashish prompt, UTF-8 / CP437

FADE="`_bashish_prompt_cp437 DB B2 B1 B0`"
#typeset TIME=`date +"%R:%S"`
#typeset DATE=`date +"%a %h %d"`
TIME=%*
DATE=%D

function _bashish_prompt {
PS1="%{[3${MAINCOLOR};4${MAINCOLOR};1m%}$FADE%{[37;4${MAINCOLOR};1m%}$USER@$HOST%{[0m%}%{[3${MAINCOLOR};40m%}$FADE%{[37;40;1m%} ${DATE} ${TIME}[9${MAINCOLOR}m[6D:[2C:[2C
%{[3${MAINCOLOR};40;1m%}"`_bashish_prompt_cwd "%%{\033[0;3${MAINCOLOR}m%%}" "%%{\033[3${MAINCOLOR};1m%%}" \`expr $COLUMNS / 2\``"/%{[0m%} "
PS2="%{[3${MAINCOLOR};40m%}$FADE%{[0m%}>"
}
_bashish_prompt
