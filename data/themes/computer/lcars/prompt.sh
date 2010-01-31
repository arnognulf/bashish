#!/bin/sh
## freebsd, netbsd, and openbsd

FGBLUE="[34m"
FGYELLOW="[33m"
FGCYAN="[36m"
NORMAL="[0m"
FGRED="[31m"

case $BASHISH_LANG in
*UTF-8)
. $HOME/.bashish/bt/prompt/prompt.sh.UTF-8
;;
*CP437)
. $HOME/.bashish/bt/prompt/prompt.sh.CP437
;;
*)
## creates $FILLX
FILLX=`_bashish_prompt_fillx = 31`

PS1="\
$FGBLUE"_====="$FILLX$NORMAL $FGYELLOW"========================"
$FGCYAN\
"======"$NORMAL       Logged in:  $USER
$FGYELLOW"======"$NORMAL       Stardate:   "`date +%s`"
$FGBLUE\
"======"
 \[$FGBLUE\]========== \[$FGRED\]============\[$NORMAL\]   "
esac

unset FGBLUE FGYELLOW FGCYAN NORMAL FGRED
