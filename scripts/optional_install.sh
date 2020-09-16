# Peek - Gif Recorder
read -p "Do you want to install Peek - Gif Recorder? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo add-apt-repository ppa:peek-developers/stable
    sudo apt update
    sudo apt install peek -y
fi

# Kazam - video recorder
read -p "Do you want to install Kazam video recorder? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo add-apt-repository ppa:sylvain-pineau/kazam
	sudo apt-get update -y
	sudo apt install kazam -y
fi

# Pinta - Photo editing software
read -p "Do you want to install Pinta - Photo editing software? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install pinta -y
fi


# Shutter - Screenshot software
read -p "Do you want to install Shutter - Screenshot software? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install shutter -y
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

# Local Time Setting
read -p "Do you want to set hardware local RTC clock to be stored in local time? This will resolve time switching issues between Ubunutu and Windows. " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    timedatectl set-local-rtc 1
fi

# Eclipse for C++:
read -p "Do you want to install Eclipse for C++ " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
# this also installed openjdk 7
    sudo apt-get install eclipse eclipse-cdt -y
fi
# VSCODE
read -p "Do you want to install VScode? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install software-properties-common apt-transport-https wget -y
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update
    sudo apt install code -y
fi

# PIP for Python3
read -p "Do you want to install Pip for Python3? (pip3) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install python3-pip -y
fi

#powerline
read -p "Do you want to install powerline for terminal? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt-get install powerline -y
fi

#Homebrew
read -p "Do you want to install homebrew? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt-get install build-essential curl file git -y
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
    echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
fi

# PPA Remover
read -p "Do you want to install PPA remover? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt-get install ppa-purge -y
fi

# zsh
read -p "Do you want to install zsh? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install zsh -y
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
fi

# Vim
read -p "Do you want to install vim? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt-get install vim -y
fi

# fzf
read -p "Do you want to install fzf for terminal? This requires homebrew. " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    gnome-terminal -e --hold brew install fzf
fi

#tmux
read -p "Do you want to install tmux" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo apt install tmux -y
fi
