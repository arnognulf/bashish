#!/bin/sh
## freebsd, netbsd, and openbsd
## creates $FILLX


_bashish_prompt ()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
local FGBLUE="${ESC}[34m"
local FGYELLOW="${ESC}[33m"
local FGCYAN="${ESC}[36m"
local NORMAL="${ESC}[0m"
local FGRED="${ESC}[31m"
local UP="`_bashish_prompt_cp437 DF`"
local DO="`_bashish_prompt_cp437 DC`"
local FU="`_bashish_prompt_cp437 DB`"
local FILLX=`_bashish_prompt_fillx $UP 31`

if test "x$PROMPTSTR" = x
then
local PROMPTSTR="Stardate:   `date +%s`"
else
local PROMPTSTR="Message:    ${PROMPTSTR}"
fi

TITLE=LCARS

PS1="\
$FGBLUE$DO$FU$FU$FU$FU$FU$FILLX$NORMAL $FGYELLOW$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP
$FGCYAN$DO$DO$DO$DO$DO$DO$NORMAL       Logged in:  $USER
$FGYELLOW$DO$DO$DO$DO$DO$DO$NORMAL       ${PROMPTSTR}
$FGBLUE$DO$DO$DO$DO$DO$DO
 ${EMBED}$FGBLUE${UNEMBED}$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP ${EMBED}$FGRED${UNEMBED}$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP$UP${EMBED}$NORMAL${UNEMBED}   "

}
