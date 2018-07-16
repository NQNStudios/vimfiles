#! /bin/bash

# Add this to your Ubuntu startup scripts to remap caps lock to escape

xmodmap -e "clear lock"
xmodmap -e "keysym Caps_Lock = Escape"
