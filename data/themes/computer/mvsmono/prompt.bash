#!/bin/sh
PROMPT_COMMAND="testloc"
testloc ()
{
	stty -echo
	printf "\033[6n"
	local i=0 CURPOS=""
	until test "$i" = 7
	do
		local CHAR=""
		read -n1 CHAR
		case "$CHAR" in
		|[|[0-9]|\;) CURPOS="$CURPOS$CHAR";let i++;;
		R)CURPOS="$CURPOS$CHAR";break;;
		esac
		#printf $i
	done
	#printf "\033[8D"
	local POS IFS="[;" i=0
	XPOS="6"
	YPOS=""
	for POS in $CURPOS
	do
		test $i = 1 && YPOS=$POS
		let i++
	done
	IFS=""
	test "$YPOS" -gt $(($LINES - 2)) && {
		printf "\n\n\033["$(($LINES - 2))";0H"
	}
	case "${#YPOS}" in
	2) YPOS=0$YPOS;;
	1) YPOS=00$YPOS;;
	esac
	stty echo
}

#promptcount ()
#{
#	let XPOS++
#}
_bashish_prompt()
{
PS1="\[7[0;"'$(($LINES - 2))'"r["'$(($LINES - 1))'";0H`_bashish_prompt_fillx \`_bashish_prompt_cp437 C4\``[7m4[0m[4mA[0m["'$LINES'";"'$(($COLUMNS - 7))'"H"'$YPOS'"/0158\]COMMAND  ===> "
}
## count 027/00n
## the prompt redraws each time a character is printed

#4ª
