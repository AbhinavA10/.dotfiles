#!/bin/bash
echo "--- Installing basic tools..."

# install basic items
sudo apt install build-essential curl wget file git git-gui gitk -y
#build-essential includes gcc, g++, and make

#CPU Temp sensor - https://itsfoss.com/check-laptop-cpu-temperature-ubuntu/
sudo apt install psensor -y

#Tools
sudo apt install software-properties-common apt-transport-https -y
sudo apt autoremove -y 
