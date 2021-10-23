#         _       _ _            
#   __  _(_)_ __ (_) |_ _ __ ___ 
#   \ \/ / | '_ \| | __| '__/ __|
#  _ >  <| | | | | | |_| | | (__ 
# (_)_/\_\_|_| |_|_|\__|_|  \___|

# Loads keymappings that I have configured
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap &

# Mute the mic by default
pactl set-source-mute 2 toggle &

# Start xmonad
exec xmonad
