#!/bin/sh
#!/bin/bash
##############################################################################

_bashish_prompt() 
{
	eval $(_bashish_prompt_shellvars "$SHELLNAME")
PROMPT_COMMAND="_BASHISH_PROMPT_RCS=\$(_bashish_prompt_rcs \${_BASHISH_PROMPT_RCS} ) && _bashish_promptupdate"

	local RCS_PS1=$(_bashish_prompt_rcs)
	test "x${RCS_PS1}" != x && RCS_PS1="(${RCS_PS1}) "
	local ROOT=""
	test "x${UID}" = x0 && ROOT="# "


	local UNDERLINE LINECHAR
	TITLE="${HOSTNAME%%.*}"
	test x"$PROMPTSTR" = x && PROMPTSTR="$HOSTNAME"
	i=1
	LINECHAR=" "
	VT100LINECHAR="${ESC}[4m"
	## special case for the Bitstream Century SchoolBook Mono,
	## where underline simply looks better than vt100 underline
	## in terminals which do not support vt100 underlines this may
	## also be a better choice
	## gnome-terminal is problematic to detect
	## it exports WINDOWID and COLORTERM to terminals exported below it
	if test "x${COLORTERM}" = xgnome-terminal
	then
		case "$(xprop -id $WINDOWID 2>/dev/null)" in
		*gnome-terminal-window*)
			case "$(gconftool-2 --get /apps/gnome-terminal/profiles/Default/font 2>/dev/null)" in
			"CentSchbook Mono BT "*)
				LINECHAR="_"
				VT100LINECHAR=""
			esac
		esac
	fi
	while test "$i" -lt "$COLUMNS"
        do
                let i++
                UNDERLINE=$UNDERLINE"$LINECHAR"
        done
        test "x${LINECHAR}" = "x " && UNDERLINE="${ESC}[4m$UNDERLINE"

	## some crazy vt100 voodoo below to cope with writing a character in
	## the rightmost column without bash bailing out

	## DEC sequences are kinda fuzzy to read, here they are translated to english:
	## underline, newline, non-printing string, cursor up, move cursor to rightmost column
	## move cursor down, move cursor to leftmost column, turn on bold attrib, end non-printing string,
	## print promptstring, enable non printing characters, reset attributes, disable non-printing characters
	NONPRINT_START=""
	NONPRINT_END=""
	NEWLINE="
"
	PS1="${UNDERLINE}${NEWLINE}${EMBED}${ESC}[A${ESC}[${COLUMNS}G${VT100LINECHAR}${LINECHAR}${ESC}[0m${ESC}[B${ESC}[0G${ESC}[1;7m${UNEMBED} "$PROMPTSTR" ${RCS_PS1}${ROOT}${EMBED}${ESC}[0m${UNEMBED} "
}
