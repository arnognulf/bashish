#!/bin/sh
##################################################################################
## Copyright (c) 2006, Thomas Eriksson
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without 
## modification, are permitted provided that the following conditions 
## are met:
##
## * Redistributions of source code must retain the above copyright notice, 
##   this list of conditions and the following disclaimer.
## * Redistributions in binary form must reproduce the above copyright notice,
##   this list of conditions and the following disclaimer in the documentation
##   and/or other materials provided with the distribution.
## * Neither the name of the Bashish project nor the names of its contributors 
##   may be used to endorse or promote products derived from this software 
##   without specific prior written permission.
##
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
## AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
## IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
## ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
## LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
## CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
## SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
## INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
## CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
## ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF 
## THE POSSIBILITY OF SUCH DAMAGE.
##
##################################################################################
##
## Bluesteel by arnognulf
##
###########################
TIME="\t"
FADE1=[32m

## mash up this function to not use bash string manipulation
## if DIRELEMENT1 = PWDELEM1
BASHISH_C4=`_bashish_prompt_cp437 C4`
BASHISH_DA=`_bashish_prompt_cp437 DA`
BASHISH_C0=`_bashish_prompt_cp437 C0`
function _bashish_prompt {
LINE=`_bashish_prompt_fillx $BASHISH_C4`

PS1="\
[3${MAINCOLOR}m$LINE["$COLUMNS"D[37m$BASHISH_DA$BASHISH_C4[9${MAINCOLOR}m$BASHISH_C4[3${MAINCOLOR}m$BASHISH_C4[90m$BASHISH_C4[9${MAINCOLOR}m[[3${MAINCOLOR}m""$USER[9${MAINCOLOR}m""@[3${MAINCOLOR}m""$HOSTNAME[9${MAINCOLOR}m][90m$BASHISH_C4$BASHISH_C4[3${MAINCOLOR}m${BASHISH_C4}[9${MAINCOLOR}m${BASHISH_C4}[37m${BASHISH_C4}${BASHISH_C4}[9${MAINCOLOR}m${BASHISH_C4}[9${MAINCOLOR}m[[3${MAINCOLOR}m$TIME[9${MAINCOLOR}m[6D:[2C:[2C][90m${BASHISH_C4}${BASHISH_C4}[3${MAINCOLOR}m${BASHISH_C4}[9${MAINCOLOR}m${BASHISH_C4}[37m${BASHISH_C4}${BASHISH_C4}[9${MAINCOLOR}m${BASHISH_C4}[9${MAINCOLOR}m["`_bashish_prompt_cwd "\[\033[9"${MAINCOLOR}"m\]" "\[\033[3"${MAINCOLOR}"m\]" 58`"[9${MAINCOLOR}m][90m$BASHISH_C4$BASHISH_C4[3${MAINCOLOR}m$BASHISH_C4[9${MAINCOLOR}m$BASHISH_C4[37m$BASHISH_C4$BASHISH_C4[9${MAINCOLOR}m$BASHISH_C4$BASHISH_C4[0m
\[[9${MAINCOLOR}m\]$BASHISH_C0\[[3${MAINCOLOR}m\]$BASHISH_C4\[[90m\]$BASHISH_C4\[[9${MAINCOLOR}m\]>\[[0m\] "
}
_bashish_prompt
