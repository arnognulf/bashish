#!/bin/sh
#!/bin/bash
_bashish_prompt() {
eval $(_bashish_prompt_shellvars $SHELLNAME)
local UP="`_bashish_prompt_cp437 DF`"
local DO="`_bashish_prompt_cp437 DC`"
PS1="${ESC}[34m$DO${ESC}[34;103m$UP${ESC}[0;34m$DO
 $UP${ESC}[0m  ${ESC}[31m$DO${ESC}[31;103m$UP${ESC}[0;31m$DO
 ${ESC}[97m$DO${ESC}[97;43m$UP${ESC}[0;97m$DO ${ESC}[31m$UP${ESC}[0m
  ${EMBED}${ESC}[97m${UNEMBED}$UP${EMBED}${ESC}[0m${UNEMBED}  "
}
