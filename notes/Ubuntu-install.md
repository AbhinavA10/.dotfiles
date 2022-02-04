# Ubuntu Install and Setup
Common tools/programs that may need to be manually installed are listed as the first few entries below.

This file does not outline installation instructions for tools already installed using `install.sh` or `optional_install.sh`

## Git
```bash
git config --global user.name "Your Name"
git config --global user.email "youremail@domain.com"
```

If installing git-all has a `runit` and `git-dameon` ... error, then do:

```bash
sudo apt-get purge runit
sudo apt-get purge git-all
sudo apt-get purge git
sudo apt-get autoremove
sudo apt update
sudo apt install git
```

https://askubuntu.com/questions/765565/how-to-fix-processing-with-runit-and-git-daemon-run

### SSH setup:
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
sudo apt-get install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub
```
- paste into github section
- Then test connection with `ssh -T git@github.com`

## Firefox
To add autoscrolling to ubunutu:

- In firefox, go to Preferences/Advanced/General/Browsing/"Use autoscrolling"

To make backspace button go back a page:
- https://itsfoss.com/enable-backspace-firefox-ubuntu-linux/
- but change value from 2 to 0.

## Keyboard Shortcuts:
### Custom shortcut for nautalis:
Creating a key shortcut to open Nautalis using `Windows+E`

https://help.ubuntu.com/stable/ubuntu-help/keyboard-shortcuts-set.html.en
- `Command` is `nautilus`

### For Window switching
- set `ALT+TAB` to window switch, and `SUPER+TAB` to `app switch`

## NVM
To install latest version of node:
```bash
nvm install node
nvm use node 
```

## FreeFileSync
Go to https://freefilesync.org/download.php. Download latest version for Linux.

```bash
sudo tar -zxvf ~/Downloads/FreeFileSync_*_Linux.tar.gz -C /opt
gedit ~/.local/share/applications/FreeFileSync.desktop
```

Then copy paste the following into the notepad file that opens:
```
[Desktop Entry]
Type=Application
Name=FreeFileSync
GenericName=Folder Comparison and Synchronization
GenericName[de_DE]=Ordnervergleich und Synchronisation
Exec=/opt/FreeFileSync/FreeFileSync %F
Icon=/opt/FreeFileSync/Resources/FreeFileSync.png
NoDisplay=false
Terminal=false
Categories=Utility;FileTools;
StartupNotify=true
```
Source: http://ubuntuhandbook.org/index.php/2020/06/install-freefilesync-10-25-ubuntu-20-04/

## ROS - Kinetic

```bash
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

## Pip for Python 2

```bash
sudo apt install python-pip
```

## Terminal Profiles

Sources: [Exporting and Importing](https://unix.stackexchange.com/questions/448811/how-to-export-a-gnome-terminal-profile) and [Resetting](https://unix.stackexchange.com/questions/448811/how-to-export-a-gnome-terminal-profile)

To export gnome-terminal profiles:
```bash
dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf
```

To load gnome-terminal profiles from a file named `gnome-terminal-profiles.dconf`:
```bash
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
```

To reset terminal settings:
```bash
dconf reset -f /org/gnome/terminal/
```

## OpenCV for C+

```bash
sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
```

- Instructions to install are located [here](https://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html)
- Download OpenCV `opencv-2.4.13.6` from [here](https://github.com/opencv/opencv/releases?after=4.0.0-rc)
- extract tarball (zipfile) after download:
  - `tar -xvzf downloaded_file_name_here.tar.gz`

then follow the rest of the instructions except `sudo make install`. Packages compiled from sourced and installed using `make install` are often very hard to uninstall. Instead, use [this](https://stackoverflow.com/questions/1439950/whats-the-opposite-of-make-install-i-e-how-do-you-uninstall-a-library-in-li) to create a package (a `.deb` file) and install that:

```bash
sudo apt-get install checkinstall
# instead of sudo make install, we can now use:
sudo checkinstall
```

To remove a package after having installed with checkinstall

```bash
dpkg -r $PACKAGE_NAME_YOU_CHOSEN
```

To test the installation of OpenCV, try running the program [shown here](https://docs.opencv.org/2.4/doc/tutorials/introduction/linux_gcc_cmake/linux_gcc_cmake.html#linux-gcc-usage)

## Python

- fix pip and pip2 using the stackoverflow link -- the 'cant import main' error in pip.
- follow instructuions on tensorflow website to install tensorflow in venv

```
     sys.exit(__main__._main()) -- modified line
     sys.exit(main()) -- original line
```

See: https://stackoverflow.com/questions/28210269/importerror-cannot-import-name-main-when-running-pip-version-command-in-windo

Also, we can't source ros in bash and still use python 3 for another project. See [this](https://stackoverflow.com/questions/43019951/after-install-ros-kinetic-cannot-import-opencv/43500095#43500095)

```bash
pip install -r requirements.txt
```

## venv

```bash
pip3 install virtualenv
```

### Make a new virtualenv

These virtualenv's are non-relocatable

```bash
virtualenv -p python3 ./venv
source venv/bin/activate
```

## dlib

Install this, once in the venv.

See [this](https://www.pyimagesearch.com/2018/01/22/install-dlib-easy-complete-guide/) for more info on installing.

```bash
pip install dlib
```

## FZF and vim
```bash
sudo apt-get install vim
```
https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
Follow instructions for fzf and vim plugin

Install vim-plug:
https://github.com/junegunn/vim-plug
https://github.com/junegunn/fzf.vim/issues/85
https://vi.stackexchange.com/questions/13718/how-to-install-fzf-vim-with-vundle

## OpenVINO

- installed Intel OpenVINO toolkit
- did not install or configure Model optimizer

## protobuf3

Protobuf3 installation instructions:
Follow instructions from here: https://askubuntu.com/questions/1072683/how-can-i-install-protoc-on-ubuntu-16-04

```bash
sudo apt-get install autoconf automake libtool curl make g++ unzip
```

- Download protobuf-all-v3.6.1.tar.gz. from [here](https://github.com/protocolbuffers/protobuf/releases/tag/v3.6.1)
- Extract the contents and change in the directory

```bash
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

```bash
echo deb https://josm.openstreetmap.de/apt $(lsb_release -sc) universe |
sudo tee /etc/apt/sources.list.d/josm.list > /dev/null
wget -q https://josm.openstreetmap.de/josm-apt.key -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get remove josm josm-plugins
sudo apt-get install josm
```

## Arc theme -- Ubuntu 16

https://www.omgubuntu.co.uk/2016/06/install-latest-arc-gtk-theme-ubuntu-16-04
https://github.com/horst3180/arc-theme

```bash
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
sudo apt-get update && sudo apt-get install arc-theme
wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
sudo apt-key add - < Release.key
```

## Octave

```bash
sudo add-apt-repository ppa:octave/stable
sudo apt-get update
sudo apt-get install octave # will install octave 4.2 instead of 4
sudo apt install liboctave-dev
octave
pkg install -forge general control signal image

```

## Slack 

```bash
sudo snap install slack --classic
```

## Windows-like Theme with Gnome extensions
For windows-like start menu and task bar

- https://github.com/vmavromatis/gnome-layout-manager
- https://www.lifewire.com/how-to-get-windows-style-gnome-taskbar-4685264

## Vitals - Gnome Extension
Another useful gnome extension (only for Ubuntu 18+) is `Vitals`
- https://github.com/corecoding/Vitals

```bash
sudo apt install gir1.2-gtop-2.0 lm-sensors
sudo apt-get install chrome-gnome-shell
```
Navigate to https://extensions.gnome.org/extension/1460/vitals/, and install the extension

Then,
- Restart GNOME Shell (`Alt+F2`, `r`, `Enter`) and enable the extension through `gnome-tweak-tool`.

## libserial
A serial port library for C++ and Linux
```bash
cd Downloads
git clone https://github.com/crayzeewulf/libserial.git
cd libserial
./compile.sh
cd build
sudo make install # or sudo checkinstall
sudo ldconfig # update dynamic library links
sudo ln -s /usr/local/lib/libserial.a /usr/local/lib/liblibserial_static.a # update static library link
```

## fmt
A python-style string formatting library for C++
```bash
cd Downloads
git clone https://github.com/fmtlib/fmt.git
cd fmt
mkdir build
cd build
cmake -DBUILD_SHARED_LIBS=TRUE ..
make
sudo make install # or sudo checkinstall
```
