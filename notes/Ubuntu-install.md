# Ubuntu Install and Setup

## Temperature Sensor

```
sudo apt install psensor
```

https://itsfoss.com/check-laptop-cpu-temperature-ubuntu/

## Screen Recorder

Ubuntu has a built in screenshot taker.

### Peek - Gif Recorder

```
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update
sudo apt install peek
```

https://www.itsupportguides.com/knowledge-base/ubuntu/ubuntu-how-to-screen-record-to-gif/

### Kazam - video recorder

```
sudo add-apt-repository ppa:sylvain-pineau/kazam
sudo apt-get update
sudo apt install kazam
```

https://itsfoss.com/kazam-screen-recorder/

## Eclipse for C++:

```
sudo apt-get install g++
sudo apt-get install eclipse eclipse-cdt // this also installed openjdk 7
```

## Git

```
sudo apt-get install git
sudo apt-get install git-gui
sudo apt install gitk
git config --global user.name "Your Name" #Manually
git config --global user.email "youremail@domain.com" #Manually
```

If installing git-all has a `runit` and `git-dameon` ... error, then do:

```
sudo apt-get purge runit
sudo apt-get purge git-all
sudo apt-get purge git
sudo apt-get autoremove
sudo apt update
sudo apt install git
```

https://askubuntu.com/questions/765565/how-to-fix-processing-with-runit-and-git-daemon-run

### SSH setup:
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
sudo apt-get install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub
```
- paste into github list
- Then test connection with `ssh -T git@github.com`

## ROS - Kinetic

```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
sudo rosdep init
rosdep update
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo apt-get install ros-kinetic-jsk-recognition-msgs
sudo apt install ros-kinetic-jsk-rviz-plugins
sudo apt-get install ros-kinetic-rqt
sudo apt-get install ros-next-rqt-common-plugins
```

set ros variables automatically in new terminal: Note -- this causes conflicts in using `OpenCV` with python3 in a `venv`

```
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

## Pip 2 and 3

```
sudo apt install python3-pip
sudo apt install python-pip
```

## VS-Code

Download the `.deb` file from [here](https://code.visualstudio.com/), then:

```
sudo apt install ./<file>.deb
```

## Terminal Profiles

Sources: [Exporting and Importing](https://unix.stackexchange.com/questions/448811/how-to-export-a-gnome-terminal-profile) and [Resetting](https://unix.stackexchange.com/questions/448811/how-to-export-a-gnome-terminal-profile)

To export gnome-terminal profiles:

```
dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf
```

To load gnome-terminal profiles from somewhere

```
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
```

> To reset terminal settings

```
dconf reset -f /org/gnome/terminal/
```

## OpenCV for C+

```
sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
```

- Instructions to install are located [here](https://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html)
- Download OpenCV `opencv-2.4.13.6` from [here](https://github.com/opencv/opencv/releases?after=4.0.0-rc)
- extract tarball (zipfile) after download:
  - `tar -xvzf downloaded_file_name_here.tar.gz`

then follow the rest of the instructions except `sudo make install`. Packages compiled from sourced and installed using `make install` are often very hard to uninstall. Instead, use [this](https://stackoverflow.com/questions/1439950/whats-the-opposite-of-make-install-i-e-how-do-you-uninstall-a-library-in-li) to create a package (a `.deb` file) and install that:

```
sudo apt-get install checkinstall
# instead of sudo make install, we can now use:
sudo checkinstall
```

To remove a package after having installed with checkinstall

```
dpkg -r $PACKAGE_NAME_YOU_CHOSEN
```

To test the installation of OpenCV, try running the program [shown here](https://docs.opencv.org/2.4/doc/tutorials/introduction/linux_gcc_cmake/linux_gcc_cmake.html#linux-gcc-usage)

## Fixing clock issue in dual booting:

```
timedatectl set-local-rtc 1
```

## Python

- fix pip and pip2 using the stackoverflow link -- the 'cant import main' error in pip.
- follow instructuions on tensorflow website to install tensorflow in venv


     sys.exit(__main__._main()) -- modified line
     sys.exit(main()) -- original line

See: https://stackoverflow.com/questions/28210269/importerror-cannot-import-name-main-when-running-pip-version-command-in-windo

Also, we can't source ros in bash and still use python 3 for another project. See [this](https://stackoverflow.com/questions/43019951/after-install-ros-kinetic-cannot-import-opencv/43500095#43500095)

```
pip install -r requirements.txt
```

### venv

```
pip3 install virtualenv
```

### Make a new virtualenv

These virtualenv's are non-relocatable

```
virtualenv -p python3 ./venv
source venv/bin/activate
```

### dlib

Install this, once in the venv.

See [this](https://www.pyimagesearch.com/2018/01/22/install-dlib-easy-complete-guide/) for more info on installing.

```
pip install dlib
```

## Firefox

To add autoscrolling to ubunutu:

- In firefox, go to Preferences/Advanced/General/Browsing/"Use autoscrolling"

## Powerline

[How to](https://mangolassi.it/topic/14298/get-started-with-powerline-on-ubuntu/2)

```
sudo apt-get install powerline
```

then in `~/.bashrc`

```
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    source /usr/share/powerline/bindings/bash/powerline.sh
fi
```

## Homebrew

https://docs.brew.sh/Homebrew-on-Linux

## FZF and vim

sudo apt-get install vim
https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
Follow instructions for fzf and vim plugin

Install vim-plug:
https://github.com/junegunn/vim-plug
https://github.com/junegunn/fzf.vim/issues/85
https://vi.stackexchange.com/questions/13718/how-to-install-fzf-vim-with-vundle

## OpenVINO

- installed Intel OpenVINO toolkit
- did not install or configure Model optimizer

## Unity Tweak tool - Ubuntu 16

```
sudo apt-get install unity-tweak-tool
```

## Gnome Tweak tool - Ubuntu 18 and up

```
sudo apt install gnome-tweaks
```


## protobuf3

Protobuf3 installation instructions:
Follow instructions from here: https://askubuntu.com/questions/1072683/how-can-i-install-protoc-on-ubuntu-16-04

```
sudo apt-get install autoconf automake libtool curl make g++ unzip
```

- Download protobuf-all-v3.6.1.tar.gz. from [here](https://github.com/protocolbuffers/protobuf/releases/tag/v3.6.1)
- Extract the contents and change in the directory

```
./configure
make
make check
sudo apt-get install checkinstall
sudo checkinstall
sudo ldconfig # refresh shared library cache.
```

Done. The new package has been installed and saved to

/home/abhi/Downloads/protobuf-3.6.1/protobuf3_3.6.1-1_amd64.deb

You can remove it from your system anytime using:

      dpkg -r protobuf3

## JOSM

https://josm.openstreetmap.de/wiki/Download

```
echo deb https://josm.openstreetmap.de/apt $(lsb_release -sc) universe |
sudo tee /etc/apt/sources.list.d/josm.list > /dev/null
wget -q https://josm.openstreetmap.de/josm-apt.key -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get remove josm josm-plugins
sudo apt-get install josm
```

## Arc theme

https://www.omgubuntu.co.uk/2016/06/install-latest-arc-gtk-theme-ubuntu-16-04
https://github.com/horst3180/arc-theme

```
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"

sudo apt-get update && sudo apt-get install arc-theme
wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
sudo apt-key add - < Release.key
```

>

## Icon packs

https://www.fossmint.com/best-linux-icon-themes/

## PPA remover

https://askubuntu.com/questions/307/how-can-ppas-be-removed

```
sudo apt-get install ppa-purge
sudo ppa-purge ppa:whatever/ppa
```

## zsh

https://www.howtoforge.com/tutorial/how-to-setup-zsh-and-oh-my-zsh-on-linux/

```
apt install zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
source ~/.zshrc
```

https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh

## Octave

```
sudo add-apt-repository ppa:octave/stable
sudo apt-get update
sudo apt-get install octave # will install octave 4.2 instead of 4
sudo apt install liboctave-dev
octave
pkg install -forge general control signal image

```

## Custom shortcut for nautalis:
https://help.ubuntu.com/stable/ubuntu-help/keyboard-shortcuts-set.html.en
- will need to do manually
- `nautilus` is the `Command`

