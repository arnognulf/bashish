#!/bin/sh
##################################################################################
## Bashish, a console theme engine
## Copyright (C) 2005 Thomas Eriksson
##
## This program is free software; you can redistribute it and/or
## modify it under the terms of the GNU General Public License
## as published by the Free Software Foundation; either version 2
## of the License, or (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
##
## along with this program; if not, write to the Free Software
## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
##################################################################################

# http://en.wikipedia.org/wiki/ANSI_escape_code
# http://tldp.org/HOWTO/Bash-Prompt-HOWTO/

_bashish_prompt ()
{
# load ESC, EMBED and UNEMBED variables, using these will make the prompt portable to those
# shells that bashish supports
eval $(_bashish_prompt_shellvars $SHELLNAME)
# parse colors. the default ones are blue and black
eval $(_bashish_prompt_parsecolors "$@")
test "x$BASHISH_COLOR0" = x && eval $(_bashish_prompt_parsecolors blue black)
test "x$BASHISH_COLOR1" = x && eval $(_bashish_prompt_parsecolors "$1" black)


PS1="${EMBED}\
${ESC}${STORECUR}\
${ESC}[0;0${SETSCROLLREG}\
${ESC}[0;$((LINES-1))${SETSCROLLREG}\
${ESC}[$LINES;0${SETCURPOS}\
${ESC}[${FG}${BASHISH_COLOR1};${BG}${BASHISH_COLOR0}${SETCOLOR}${USER}@${HOSTNAME}:${PWD}\
${ESC}[K\
${ESC}${RESTORECUR}\
${ESC}[${FG}${BASHISH_COLOR0};40${SETCOLOR}\
${UNEMBED}\$ \
${EMBED}\
${ESC}[${NORMAL}${SETCOLOR}\
${UNEMBED}"

# All escape charachters we don't want counted (we don't want any except for $), we put between
# ${EMBED} and ${UNEMBED}. Otherwise, eg. a color set escape character will be counted as a character
# and the shell will break the line before the cursor has reached the end of the line

# 1.  Embed (don't count characters)
# 2.  Save cursor postion -- ${STORECURS}
# 3.  Say that we only want to be able to scroll between first and second last line,
#     this will have the effect that the user$host:path is always on the bottom line.
#     But first we have to reset the scrolling region to avoid a bug in gnome terminal
#     (if we don't do this, sometimes the path won't be updated)
#     [0;0${SETSCROLLREG} (do reset)
#     [0;$((LINES-1))${SETSCROLLREG} (set scrolling region to all lines execept the last)
# 4.  Go to the last line -- [$LINES;0${SETCURPOS}
# 5.  Make the foreground color black and the background blue (if not other colors are supplied)
#     [${FG}${BASHISH_COLOR1};${BG}${BASHISH_COLOR0}${SETCOLOR}
# 6.  Give info: user$host:path -- ${USER}@${HOSTNAME}:${PWD}
#     (even though this will make printable characters, we don't want
#     to count them as such since we won't _type_ anything on that line. We only want to count those characters
#     that are on the line we enter commands)
# 7.  Erase to the end of the line. This will have the effect that the whole line will have light gray as
#     background color, not just the user$host:path characters -- [K
# 8.  Set the fg color to blue (if not changed) and bg to black (always) -- [${FG}${BASHISH_COLOR0};40${SETCOLOR}
# 9.  Unembed. That is start counting characters again. Supply the prompt "$ " as well - ${UNEMBED}\$ 
# 10.  Umbed. After this we will count all characters. The only characters are "\$ ". 
# 11. Embed (don't count characters)
# 12. Set color to normal -- [${NORMAL}${SETCOLOR}
# 13. Unembed (start counting characters again)

# the same prompt but only bash compatible
#PS1="\[\033[s\033[0;0r\033[0;$((LINES-1))r\033[$LINES;0f\033[30;47m\u@\h:\w\033[K\033[0;0m\033[u\]\$ "

}
