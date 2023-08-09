# Ubuntu Install and Setup
Common tools/programs that may need to be manually installed are listed as the first few entries below.

This file does not outline installation instructions for tools already installed using `install.sh` or `optional_install.sh`

## SSH setup:
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
To add autoscrolling:
- go to Preferences/Advanced/General/Browsing/"Use autoscrolling"

To make backspace button go back a page:
- go to `about:config`
- search for `backspace`
- Cange value from `2` to `0`.

## Keyboard Shortcuts:
### Custom shortcut for nautalis:
Creating a key shortcut to open Nautalis using `Windows+E`

https://help.ubuntu.com/stable/ubuntu-help/keyboard-shortcuts-set.html.en
- `Command` is `nautilus`

### For Window switching
- set `ALT+TAB` to window switch, and `SUPER+TAB` to `app switch`


## Vitals - Gnome Extension
[`Vitals`](https://github.com/corecoding/Vitals)

- `sudo apt install gnome-shell-extension-manager gir1.2-gtop-2.0 lm-sensors`
- Open the Extension Manager application, search for `Vitals` and click Install.

## Git
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

## NVM
To install latest version of node:
```bash
nvm install node
nvm use node 
```

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

## Octave

```bash
sudo add-apt-repository ppa:octave/stable
sudo apt-get update
sudo apt-get install octave # will install octave 4.2 instead of 4
sudo apt install liboctave-dev
octave
pkg install -forge general control signal image

```

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

## NVIDIA Drivers

You can use the `Additional Drivers` application as well, or:

```bash
ubuntu-drivers devices
sudo apt install nvidia-driver-535 # install recommended driver
sudo reboot
nvidia-smi
sudo nvidia-settings
sudo snap install nvtop
```
