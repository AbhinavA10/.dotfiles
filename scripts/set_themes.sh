#!/bin/bash
echo "--- Setting themes..."

# Load Terminal Theme (Bash)
dconf load /org/gnome/terminal/legacy/profiles:/ < ~/.dotfiles/gnome-terminal-profiles.dconf
