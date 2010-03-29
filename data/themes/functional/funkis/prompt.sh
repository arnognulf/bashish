#!/bin/sh
##################################################################################
## Bashish, a console theme engine
## Copyright (C) 2010 Samuel Skånberg
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
# the same prompt but only bash compatible
#PS1="\[\033[s\033[0;$((LINES-1))r\033[$LINES;0f\033[30;47m\u@\h:\w\033[K\033[0;0m\033[u\]\$ "

# load ESC, EMBED and UNEMBED variables, using these will make the prompt portable to those
# shells that bashish supports
eval $(_bashish_prompt_shellvars $SHELLNAME)
PS1="${EMBED}\
${ESC}[A\
${ESC}[B\
${ESC}[s\
${ESC}[0;$(($LINES-1))r\
${ESC}[$LINES;0H\
${ESC}[30;47m${USER}@${HOSTNAME%%.*}:${PWD}\
${ESC}[K\
${ESC}[0;0m\
${ESC}[u${UNEMBED}\$ "
# All escape charachters we don't want counted (we don't want any except for $), we put between
# ${EMBED} and ${UNEMBED}
# 1. Save cursor postion -- ${ESC}[s
# 2. Say that we only want to be able to scroll between first and second last line,
#    this will have the effect that the user$host:path is always on the bottom line -- ${ESC}[0;$((LINES-1))r
# 3. Go to the last line -- ${ESC}[$LINES;0H
# 4. Make the foreground colot black and the background light gray --${ESC}[30;47m 
# 5. Give info: user$host:path -- \u@\h:\w (even though this will make printable characters, we don't want
#    to count them as such since we won't _type_ anything on that line. We only want to count those characters
#    that are on the line we enter commands)
# 6. Erase to the end of the line. This will have the effect that the whole line will have light gray as
#    background color, not just the user$host:path characters -- ${ESC}[K
# 7. Reset the colors -- {ESC}[0;0m
# 8. Restore the cursor position we saved in step 1 -- ${ESC}[u
# 9. Umbed. After this we will count all characters. The only characters are "\$ ". 
}
