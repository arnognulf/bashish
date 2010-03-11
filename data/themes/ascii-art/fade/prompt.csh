#!/usr/bin/env csh 
 # Blue
# Created by BadlandZ in v.0.4b
# Adapted by jf
# Changed By Spidey 08/06 Adding Ending brackets \]
# Changed by Arnognulf, converted to Bashish prompt, UTF-8 / CP437

set FADE="`_bashish_prompt_cp437 DB B2 B1 B0`"
set TIME=`date +"%a %b %R:%S"`
#alias precmd set prompt="[3${MAINCOLOR};4${MAINCOLOR};1m$FADE[37;4${MAINCOLOR};1m%n@$HOST[0m[3${MAINCOLOR};40m$FADE[37;40;1m %d ${TIME}[9${MAINCOLOR}m[3D:[2C \\
#[3${MAINCOLOR};40;1m`_bashish_prompt_cwd $SHELLNAME $SHELLNAME '%[0;3${MAINCOLOR}m%' '%[3${MAINCOLOR};1m%' 0 `/[0m "

set prompt="[3${MAINCOLOR};4${MAINCOLOR};1m$FADE[37;4${MAINCOLOR};1m$USER@`hostname`[0m[3${MAINCOLOR};40m$FADE[37;40;1m ${TIME}[9${MAINCOLOR}m[6D:[2C:[2C \
[3${MAINCOLOR};40;1m`_bashish_prompt_cwd $SHELLNAME $SHELLNAME '[0;3${MAINCOLOR}m' '[3${MAINCOLOR};1m' 0 `/[0m "

alias cd 'chdir \!* && source $home/.bashish/bt/prompt/prompt.csh'

set prompt2="[3${MAINCOLOR};40m$FADE[0m>"
