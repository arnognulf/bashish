#!/usr/bin/env csh 
 #!/bin/csh
##################################################################################
## Copyright (c) 2010, Thomas Eriksson
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


set TIME=`date +"%R:%S"`
set FADE1=[32m

## mash up this function to not use bash string manipulation
## if DIRELEMENT1 = PWDELEM1
set LINE="`_bashish_prompt_cp437 C4`"

foreach COLUMNS ( `stty size` )
	:
end



set prompt="%{[3${MAINCOLOR}m%}`_bashish_prompt_fillx $LINE`%{[A[37m%}`_bashish_prompt_cp437 DA`$LINE%{[9${MAINCOLOR}m$LINE[3${MAINCOLOR}m$LINE%{[90m$LINE%{[9${MAINCOLOR}m[[3${MAINCOLOR}m""$USER%{[9${MAINCOLOR}m""@[3${MAINCOLOR}m""`hostname`[9${MAINCOLOR}m][90m$LINE$LINE[3${MAINCOLOR}m─[9${MAINCOLOR}m─[37m──[9${MAINCOLOR}m─[9${MAINCOLOR}m[[3${MAINCOLOR}m$TIME[9${MAINCOLOR}m[6D:[2C:[2C][90m──[3${MAINCOLOR}m─[9${MAINCOLOR}m─[37m──[9${MAINCOLOR}m─[9${MAINCOLOR}m[`_bashish_prompt_cwd $SHELLNAME '\033[9${MAINCOLOR}m' '\033[3${MAINCOLOR}m' 58`[9${MAINCOLOR}m][90m$LINE$LINE[3${MAINCOLOR}m$LINE%{[9${MAINCOLOR}m%}$LINE%{[37m%}$LINE$LINE%{[9${MAINCOLOR}m%}$LINE$LINE\
%{[9${MAINCOLOR}m%}`_bashish_prompt_cp437 C0`%{[3${MAINCOLOR}m%}$LINE%{[90m%}$LINE%{[9${MAINCOLOR}m%}>%{[0m%} "
alias cd "chdir \!*;source $HOME/.bashish/bt/prompt/prompt.tcsh"
