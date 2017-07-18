#!/usr/bin/env sh

######################################################################
# @author      : oisov (oisov@$HOSTNAME)
# @file        : run_polybar
# @created     : tirsdag juli 18, 2017 16:52:07 CEST
#
# @description : 
######################################################################

killall polybar
polybar bar1 -c ~/.polybar &
# polybar bar2 -c ~/.polybar &
# polybar topbar1 -c ~/.polybar &
# polybar topbar2 -c ~/.polybar &
