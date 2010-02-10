## @(#) created by ratdog
#######################
##
## anyone remember interspace/BX? ehh ohh well
## this is a port of my theme (yeeeeaaaahhh!)
##                                              -- ratdog

## repacked to bt, added the drift font removed some stuff, generally messed
## it up -- arne
## Maybe we should ADD MORE COLORS!#@#(*&#!

_bashish_prompt()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)

typeset BASHISH_BF=$(_bashish_prompt_cp437 BF) # ┐
typeset BASHISH_C0=$(_bashish_prompt_cp437 C0) # └
typeset BASHISH_C4=$(_bashish_prompt_cp437 C4) # ─

typeset LCYAN="${EMBED}${ESC}[1;36m${UNEMBED}" 
typeset CYAN="${EMBED}${ESC}[0;36m${UNEMBED}" 
typeset GREY="${EMBED}${ESC}[1;30m${UNEMBED}" 
typeset LGREY="${EMBED}${ESC}[0;37;40m${UNEMBED}" 
typeset NCOLOR="${EMBED}${ESC}[0m${UNEMBED}"

test "x${PROMPTSTR}" = x && typeset PROMPTSTR="${USER}$GREY@$CYAN${HOSTNAME}"

## And now, for the prompt!
PS1="\
$GREY${BASHISH_BF} ($LCYAN$PROMPTSTR$GREY) [$LCYAN${TIME}${ESC}[0;36m${ESC}[6D:${ESC}[2C:${ESC}[2C$GREY|$CYAN${DATE}$GREY] [$CYAN`_bashish_prompt_cwd "${EMBED}${ESC}[1;30m${UNEMBED}" "${EMBED}${ESC}[0;36m${UNEMBED}" 58`$GREY]
$GREY${BASHISH_C0}$CYAN${BASHISH_C4}${BASHISH_C4}$LCYAN${BASHISH_C4}$LCYAN>$NCOLOR "
}
_bashish_prompt
