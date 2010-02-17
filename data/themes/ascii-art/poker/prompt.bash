#!/bin/sh
#!theme
_bashish_prompt ()
{
HEARTS="`_bashish_prompt_cp437 03`"
DIAMONDS="`_bashish_prompt_cp437 04`"
SPADES="`_bashish_prompt_cp437 06`"
CLOVER="`_bashish_prompt_cp437 05`"

## 0 1 2 3 4 5 6 7 8 9
## 4 5 6 7 8 9 J Q K A
## b b b c c c d d e e
## $BASHISHDIR/bin/color $RANDOM$RANDOM
## value $RANDOM$RANDOM
## Royal
## Straight
## Flush
## Full House
## Four of
## Thirds of
## A pair of
## /dev/null
##
## CARD0[0]=1

cardcolor()
{
	BLACK="[47;30m"
	RED="[47;31m"
	case "$RANDOM" in
	*0|*1|*2)
	CARD_COLOR="$RED$HEARTS"
	CARD_FIGURE=$HEARTS
	;;
	*3|*4)
	CARD_COLOR="$BLACK$CLOVER"
	CARD_FIGURE=$CLOVER
	;;
	*5|*6|*7)
	CARD_COLOR="$RED$DIAMONDS"
	CARD_FIGURE=$DIAMONDS
	;;
	*8|*9)
	CARD_COLOR="$BLACK$SPADES"
	CARD_FIGURE=$SPADES
	esac
printf $CARD_COLOR
}

## limited to 4,5,6,7,8,9,J,Q,K,A
## no 10 because 10 uses two characters which complicates things

cardvalue()
{	
	case "$RANDOM" in
	*0)
	CARD_VALUE=4
	;;
	*1)
	CARD_VALUE=5
	:
	;;
	*2)
	CARD_VALUE=6
	:
	;;
	*3)
	
	CARD_VALUE=7
	:
	;;
	*4)
	
	CARD_VALUE=8
	:
	;;
	*5)
	
	CARD_VALUE=9
	:
	;;
	*6)
	
	CARD_VALUE=J
	:
	;;
	*7)
	
	CARD_VALUE=Q
	:
	;;
	*8)
	
	CARD_VALUE=K
	:
	;;
	*9)
	
	CARD_VALUE=A
	:
	esac
printf $CARD_VALUE
}
playhand()
{
	CARD0="`cardcolor``cardvalue`"
	CARD1="`cardcolor``cardvalue`"
	CARD2="`cardcolor``cardvalue`"
	CARD3="`cardcolor``cardvalue`"
	CARD4="`cardcolor``cardvalue`"
}
playhand	
PROMPT_COMMAND=playhand
precmd()
{
playhand
}
CH="`_bashish_prompt_cp437 DC`"
PS1="\033[37m$CH$CH $CH$CH $CH$CH $CH$CH $CH$CH
"'$CARD0'"[0m \
"'$CARD1'"[0m \
"'$CARD2'"[0m \
"'$CARD3'"[0m \
"'$CARD4'"[0m \

"
unset CH
}