#!/bin/bash
echo "--- Welcome to my .dotfiles!"

# Install tools, link dotfiles, and set themes
/bin/bash ./install.sh
/bin/bash ./optional_install.sh
/bin/bash ./link_dotfiles.sh
/bin/bash ./set_themes.sh
