#                       __ _ _      
#                      / _(_) |     
#  _____ __  _ __ ___ | |_ _| | ___ 
# |_  / '_ \| '__/ _ \|  _| | |/ _ \
#  / /| |_) | | | (_) | | | | |  __/
# /___| .__/|_|  \___/|_| |_|_|\___|
#     | |                           
#     |_|                           
# 
# From a stack overflow answer explaining zprofile: (https://apple.stackexchange.com/a/388623)
# .zlogin and .zprofile are basically the same thing - they set the environment for login shells;
# they just get loaded at different times (see below).
# .zprofile is based on the Bash's .bash_profile while .zlogin is a derivative of CSH's .login.
# Since Bash was the default shell for everything up to Mojave, stick with .zprofile.

# Start ssh-agent once per login.
# AFAIK, this command initiates .xinitrc which is responsible to initiate xmonad
ssh-agent startx

# Mute the mic by default
pactl set-source-mute 2 toggle
