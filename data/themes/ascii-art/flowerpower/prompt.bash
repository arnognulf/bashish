#!/bin/bash
function prompt {
unset -f prompt
typeset UP="`_bashish_prompt_cp437 DF`"
typeset DO="`_bashish_prompt_cp437 DC`"
PS1="[34m$DO[34;103m$UP[0;34m$DO
 $UP[0m  [31m$DO[31;103m$UP[0;31m$DO
 [97m$DO[97;43m$UP[0;97m$DO [31m$UP[0m
  \[[97m\]$UP\[[0m\]  "
}
prompt
