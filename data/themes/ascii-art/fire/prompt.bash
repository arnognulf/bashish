# Fire
# Created by BadlandZ in v.0.4b
# Adapted by jf
# Changed By Spidey 08/06 Adding Ending brackets \]
# Changed by Arnognulf, converted to Bashish prompt, UTF-8
_bashish_prompt() {
typeset COLOR1=3
typeset COLOR2=1
typeset FADE="`_bashish_prompt_cp437 DB B2 B1 B0`"
typeset FADE2="`_bashish_prompt_cp437 B0 B1 B2 DB`"

PS1="\[[01;3${COLOR1};4${COLOR1}m\]$FADE\[[01;37;4${COLOR1}m\]\u@\h\[[00;3${COLOR2};4${COLOR1}m\]${FADE2}\[[00;3${COLOR2};40m\]$FADE\[[01;37;40m\] \d
\[[3${COLOR1};40;1m\]"'`_bashish_prompt_cwd "\[\033[0;3${COLOR2};1m\]" "\[\033[3${COLOR1}m\]" \`expr $COLUMNS / 2\``'"/\[[0m\] "

PS2="\[[01;33;43m\]$FADE\[[00;31;43m\]$FADE2\[[00;31;40m\]$FADE\[[01;01;31m\]>\[[00m\] "


}
