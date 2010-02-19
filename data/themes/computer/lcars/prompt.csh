#!/usr/bin/env csh 

## freebsd, netbsd, and openbsd

set FGBLUE="`$BASHISHDIR/bin/color fgblue`"
set FGYELLOW="`$BASHISHDIR/bin/color fgyellow`"
set FGCYAN="`$BASHISHDIR/bin/color fgcyan`"
set NORMAL="`$BASHISHDIR/bin/color`"
set FGRED="`$BASHISHDIR/bin/color fgred`"

switch ($BASHISH_LANG)
  case *UTF-8:
	source $HOME/.bashish/bt/prompt/prompt.csh.UTF-8
	breaksw
  case *CP437:
	source $HOME/.bashish/bt/prompt/prompt.csh.CP437
	breaksw
  default:
## creates $FILLX
set prompt="`$BASHISHDIR/bin/np pre $SHELLNAME`$FGBLUE-=====`$BASHISHDIR/bin/fillx = 31`$NORMAL $FGYELLOW========================\
$FGCYAN======$NORMAL       Logged in:  $user\
$FGYELLOW"======"$NORMAL       Stardate:   "`date +%s`"\
$FGBLUE======\
 $FGBLUE`$BASHISHDIR/bin/np post $SHELLNAME`========== `$BASHISHDIR/bin/np pre $SHELLNAME`$FGRED`$BASHISHDIR/bin/np post $SHELLNAME`============`$BASHISHDIR/bin/np pre $SHELLNAME`$NORMAL`$BASHISHDIR/bin/np post $SHELLNAME`   "

endsw

unset FGBLUE FGYELLOW FGCYAN NORMAL FGRED
