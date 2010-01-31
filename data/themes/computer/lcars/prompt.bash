#!/bin/sh
## freebsd, netbsd, and openbsd
## creates $FILLX

FGBLUE="[34m"
FGYELLOW="[33m"
FGCYAN="[36m"
NORMAL="[0m"
FGRED="[31m"

function prompt {
	unset -f prompt
	typeset UP="`_bashish_prompt_cp437 DF`"
	typeset DO="`_bashish_prompt_cp437 DC`"
	typeset FU="`_bashish_prompt_cp437 DB`"
	typeset FILLX=`_bashish_prompt_fillx $UP 31`

PS1="\
$FGBLUE"$DO$FU$FU$FU$FU$FU"$FILLX$NORMAL $FGYELLOW"$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP"
$FGCYAN"$DO$DO$DO$DO$DO$DO"$NORMAL       Logged in:  $USER
$FGYELLOW"$DO$DO$DO$DO$DO$DO"$NORMAL       Stardate:   "`date +%s`"
$FGBLUE"$DO$DO$DO$DO$DO$DO"
 \[$FGBLUE\]$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP \[$FGRED\]$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP\[$NORMAL\]   "

}
prompt
