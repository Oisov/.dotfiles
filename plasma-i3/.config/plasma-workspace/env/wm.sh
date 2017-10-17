#!/usr/bin/env sh

######################################################################
# @author      : oisov (oisov@$HOSTNAME)
# @file        : wm
# @created     : lørdag sep. 09, 2017 16:49:53 CEST
#
# @description : 
######################################################################


# Disable KWin and use i3gaps as WM
export KDEWM=/usr/bin/i3

# Compositor (Animations, Shadows, Transparency)
# xcompmgr -C
compton -cCFb --backend glx --vsync opengl

