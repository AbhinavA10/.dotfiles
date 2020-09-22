#!/bin/bash
echo "--- Setting themes..."

# Load Terminal Theme (Bash)
dconf load /org/gnome/terminal/legacy/profiles:/ < ~/.dotfiles/gnome-terminal-profiles.dconf

# TODO: remove hardcoding of need of cloning into '~/' into using maybe
# DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"