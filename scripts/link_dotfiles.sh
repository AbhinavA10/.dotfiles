#!/bin/bash
# Adapted from bmorcos' scripts
echo "--- Linking dotfiles..."

checkandlink () {
    # This will remove $DST if the file exists!
    SRC=$1
    DST=$2
    DIR=$(dirname "$DST")

    if [ ! -d "$DIR" ]; then
        echo "--- Making directory '$DIR'"
        mkdir -p "$DIR"
    fi

    if [[ ! -h "$DST" || $(readlink "$DST") != "$SRC" ]]; then
        echo "--- Linking $DST to $SRC"
        rm -rf "$DST"
        if [[ $SRC == *".service" ]]; then
            # Special case due to systemd not allowing services to be symlinks
            ln "$SRC" "$DST"
        else
            ln -s "$SRC" "$DST"
        fi
    fi
}

echo "Linking dotfiles..."

# declare an associative array hashmap
declare -A TARGETS

TARGETS[.bashrc]=.bashrc
TARGETS[.gitconfig]=.gitconfig
TARGETS[.tmux.conf]=.tmux.conf
TARGETS[.vimrc]=.vimrc
TARGETS[.zshrc]=.zshrc

for DOTFILE in "${!TARGETS[@]}"; do
    # Get path to source dotconfig file in this repo, one folder up. 
    SRC="$( dirname "$PWD" )/$DOTFILE"
    # if destination in TARGETS entry starts with a '/', dest is an absolute path
    if [[ ${TARGETS[$DOTFILE]:0:1} == '/' ]]; then
        DST=${TARGETS[$DOTFILE]}
    # otherwise it is considered a path relative to '~'
    else
        DST="$HOME/${TARGETS[$DOTFILE]}"
    fi
    checkandlink "$SRC" "$DST"
done
