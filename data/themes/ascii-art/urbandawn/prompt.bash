#!/bin/sh
## colors and idea from this deviation by grevenlx, 
## http://www.deviantart.com/deviation/15483654/
##
## I just added some crack pot VT100 commands ;) /Thomas
##
## check if the cursor is on the ascii-pane, if so, move up a bit
#testloc ()
#{
#	printf "\n\n\n\033[3A"
#}
_bashish_prompt ()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
local FL="`_bashish_prompt_cp437 DB`"
local HA="`_bashish_prompt_cp437 DC`"
PROMPT_COMMAND="_bashish_prompt_testloc 3"
PS1="\[\0337\033[0;"'$(($LINES - 3))'"r\033["'$(($LINES - 2))'";0H\
[41;30m`_bashish_prompt_fillx \" \"`[42m\
`_bashish_prompt_fillx \"         $HA$HA $FL$FL $HA$HA       $HA$HA | \"`[43m\
`_bashish_prompt_fillx \" $HA$HA $FL$FL$HA$HA$HA$FL$FL$HA$FL$FL$HA$FL$FL$FL$FL$HA$HA$FL$FL$HA$FL$FL$HA$FL$FL\"`\0338[0m\]>"

}
