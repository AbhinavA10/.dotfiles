#!/bin/bash
echo "--- Installing optional tools..."
echo "Simply type 'y' or 'n', without the qoutation marks, for each question."
echo "There is no need to press ENTER after typing your response."

# Local Time Setting
read -p "Do you want to set hardware local RTC clock to be stored in local time? This will resolve time switching issues between Ubunutu and Windows. " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    timedatectl set-local-rtc 1
fi


# Shutter - Screenshot software
read -p "Do you want to install Shutter - Screenshot software? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install shutter -y
fi

# Peek - Gif Recorder
# https://www.itsupportguides.com/knowledge-base/ubuntu/ubuntu-how-to-screen-record-to-gif/
read -p "Do you want to install Peek - GIF Recorder? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo add-apt-repository ppa:peek-developers/stable
    sudo apt update
    sudo apt install peek -y
fi

# Kazam - video recorder
# https://itsfoss.com/kazam-screen-recorder/
read -p "Do you want to install Kazam video recorder? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo add-apt-repository ppa:sylvain-pineau/kazam
	sudo apt update -y
	sudo apt install kazam -y
fi

# Krita - Photo editing software
# https://launchpad.net/~kritalime/+archive/ubuntu/ppa
read -p "Do you want to install Krita - Photo editing software? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo add-apt-repository ppa:kritalime/ppa
    sudo apt-get update
    sudo apt-get install krita
fi

# Pinta - Photo editing software
read -p "Do you want to install Pinta - Photo editing software? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install pinta -y
fi

# Unity Tweak Tool
read -p "Do you want to install Unity Tweak Tool? This is for Ubuntu 16 " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install unity-tweak-tool -y
fi

# Gnome Tweak Tool
read -p "Do you want to install Gnome Tweak Tool? This is for Ubuntu 18 " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install gnome-tweaks -y
fi

# Eclipse for C++:
read -p "Do you want to install Eclipse for C++? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
# this also installed openjdk 7
    sudo apt-get install eclipse eclipse-cdt -y
fi

# VSCODE
# https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-20-04/
read -p "Do you want to install VScode? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install software-properties-common apt-transport-https wget -y
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update
    sudo apt install code -y
    /bin/bash ./code_extensions_install.sh
fi

# PIP for Python3
read -p "Do you want to install Pip for Python3? (pip3) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install python3-pip -y
fi

# powerline
# https://mangolassi.it/topic/14298/get-started-with-powerline-on-ubuntu/2
# https://dev.to/jeancarlosn/powerline-for-ubuntu-3o14
# https://www.freecodecamp.org/news/jazz-up-your-bash-terminal-a-step-by-step-guide-with-pictures-80267554cb22/
# https://github.com/jaspernbrouwer/powerline-gitstatus#installation
read -p "Do you want to install powerline for terminal? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install powerline -y
    # Below are untested additions
    sudo apt install fonts-powerline -y
    sudo apt install powerline-gitstatus -y
fi

# Homebrew
# https://docs.brew.sh/Homebrew-on-Linux
read -p "Do you want to install Homebrew? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install build-essential curl file git -y
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    # Note: Don't need to do below 2 steps since eval()... step is already in .bashrc
    # test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
    # echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

# zsh
# https://www.howtoforge.com/tutorial/how-to-setup-zsh-and-oh-my-zsh-on-linux/
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
read -p "Do you want to install zsh? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install zsh -y
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
fi

# fzf
# https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
read -p "Do you want to install fzf for terminal? This requires homebrew. " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    brew install fzf
    echo "\n Now installin fzf key-bindings and autocompletion"
    echo "Say 'y' to 'enable fuzzy auto-completion'"
    echo "Say 'y' to 'enable key bindings'"
    echo "Say 'n' to 'update shell configuration files'"
    /home/linuxbrew/.linuxbrew/opt/fzf/install
fi

# diff-so-fancy
# https://github.com/so-fancy/diff-so-fancy
# https://formulae.brew.sh/formula/diff-so-fancy
read -p "Do you want to install diff-so-fancy for git? This requires homebrew. " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    brew install diff-so-fancy
fi

# vim with clipboard support
read -p "Do you want to install vim? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install vim-gtk -y
fi

# tmux
read -p "Do you want to install tmux? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install tmux -y
fi

# NVM
# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04#installing-using-nvm
# https://github.com/nvm-sh/nvm
read -p "Do you want to install nvm? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    curl -s -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
fi


# Anaconda/Miniconda.
# https://docs.conda.io/en/latest/miniconda.html#linux-installers
# https://conda.io/projects/conda/en/latest/user-guide/install/linux.html
read -p "Do you want to install Miniconda3? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh
    rm "Miniconda3-latest-Linux-x86_64.sh"
fi


# PPA Remover
# https://askubuntu.com/questions/307/how-can-ppas-be-removed
# Usage to remove a ppa: : sudo ppa-purge ppa:whatever/ppa
read -p "Do you want to install PPA remover? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install ppa-purge -y
fi


# Redshift
read -p "Do you want to install Redshift? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install redshift-gtk -y
    echo "Remember to grant Redshift access to location service before launching"
    echo "This can be done by Settings -> Privacy -> Location"
fi
