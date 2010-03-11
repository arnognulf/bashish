#!/bin/sh
## @(#) created by arne
#######################
## the multics theme
##

## It is hard to excactly emulate the multics return prompt.
## multics did not have a line prompt as the input were given on a 
## FNP (front end network processor), line by line (not character by
## character as most today terminals do)
##
## Multics did have a return prompt though, the output of 'who' below (from
## Bernd):

# who

# Multics MR8.0, load 32.0/40.0; 32 users, 28 interactive, 2 daemons.
# Absentee users 2/3
# IO.SysDaemon
# Dumper.Daemon
# Roach.SysMaint
# <lots of output following>
# r 13:14 0.099 59
#
# As you can see, Multics prompted the end of a program with a line beginning
#  with "r" (for ready) followed by the actual time, the CPU time, the
# command
# took to execute and (if I remember correctly) the amount of main memory
# used

## in this theme, the prompt shows the current load and current total memory
## usage instead of command cpu time and amoint of main memory used.
## 

## stty speed 150/300 might be fun =)


_bashish_prompt() {
#IMAGELOGO=multics.png

local MEMTOTAL="$(cat /proc/meminfo |grep Mem:|sed -e "s/   / /g" -e "s/  / /g"|cut -d" " -f2)"

PS1='r $(date +%k:%M) $(uptime |cut -d" " -f12|sed "s/,//g") '$(($(cat /proc/meminfo |grep Mem:|sed -e "s/   / /g" -e "s/  / /g"|cut -d" " -f3)))'
'
}
