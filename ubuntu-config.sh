#!/bin/bash
echo
echo
echo This script will install and configure resources for Ubuntu Linux for Desktop Usage.
echo Enjoy!


echo Updating the installer.
sudo apt update -y  

echo Installing of Midnight Commander.
sudo apt install -y mc

echo Installing of Network Utilities (the old school).
sudo apt install -y net-tools

echo Installing of Git client.
sudo apt install -y git

echo Installing of Lynx console browser.
sudo apt install -y lynx

echo Installing of Vim console editor.
sudo apt install -y vim

echo Installing of Wget downloader.
sudo apt install -y wget

echo Installing of curl utility.
sudo apt install -y curl

echo Installing of nmap port scanner.
sudo apt install -y nmap

echo Installing of Unzip tool.
sudo apt install -y unzip

echo Installing of SSH access to the box.
sudo apt install -y openssh-server

echo Installing of vlc multimedia tool.
sudo apt install -y vlc

echo Installing of TimeShift snapshot backup tool.
sudo apt install -y timeshift

echo Installing of gnome-tweaks tool.
sudo apt install -y gnome-tweaks

echo Installing of auto-cpufreq tool for power management.
snap install auto-cpufreq
sudo auto-cpufreq --install

echo Installing of Howdy face recognition software and Video for Linux library.
sudo apt install -y v4l-utils 
v4l2-ctl --list-devices
sleep 5
sudo add-apt-repository ppa:boltgolt/howdy
sudo apt update -y
sudo apt install -y howdy
sleep 5

echo Configuring the Howdy Software.
echo 
echo Replace MANUALLY device_path directive to be /dev/video0 usually or with what is 
echo detected in the v4l phase.
sudo howdy config

echo Adding Face ID profile for your Linux system.
sudo howdy add

echo 
echo
echo The configuration is completed. Enjoy! :)
echo 

 
