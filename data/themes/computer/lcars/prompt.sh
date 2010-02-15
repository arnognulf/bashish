#!/bin/sh
## freebsd, netbsd, and openbsd
## creates $FILLX


_bashish_prompt ()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
typeset FGBLUE="${ESC}[34m"
typeset FGYELLOW="${ESC}[33m"
typeset FGCYAN="${ESC}[36m"
typeset NORMAL="${ESC}[0m"
typeset FGRED="${ESC}[31m"
typeset UP="`_bashish_prompt_cp437 DF`"
typeset DO="`_bashish_prompt_cp437 DC`"
typeset FU="`_bashish_prompt_cp437 DB`"
typeset FILLX=`_bashish_prompt_fillx $UP 31`

if test "x$PROMPTSTR" = x
then
typeset PROMPTSTR="Stardate:   `date +%s`"
else
typeset PROMPTSTR="Message:    ${PROMPTSTR}"
fi

TITLE=LCARS

PS1="\
$FGBLUE$DO$FU$FU$FU$FU$FU$FILLX$NORMAL $FGYELLOW$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP
$FGCYAN$DO$DO$DO$DO$DO$DO$NORMAL       Logged in:  $USER
$FGYELLOW$DO$DO$DO$DO$DO$DO$NORMAL       ${PROMPTSTR}
$FGBLUE$DO$DO$DO$DO$DO$DO
 ${EMBED}$FGBLUE${UNEMBED}$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP ${EMBED}$FGRED${UNEMBED}$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP${EMBED}$NORMAL${UNEMBED}   "

}
