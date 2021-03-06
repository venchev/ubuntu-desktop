#!/bin/bash
clear
echo Ubuntu Linux desktop configuration script.
echo Please run it in terminal opened on the GUI Desktop.
echo Otherwise not all apps will be correctly installed,
echo as they require graphical shell to initialize properly.
echo
echo
echo The configured IP address of this host is:
ip -4 a | grep inet
echo
echo
echo Adding 15 seconds before activation of the script...
echo with option for break [Ctrl-C] to stop now.
echo
sleep 15


echo Please select from the options below:
echo
echo
options=("Installation of Basic utilities." 
         "Installation of Face Recognition on this Linux Box." 
         "Installation of Remote Access to this box via NX and SSH." 
         "Adding Power Management - not for VMs" 
         "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Installation of Basic utilities.")
            echo Basic Utilities...preparing of the install process.
            echo
            echo
            echo
            echo
            echo Using this for network activation of resources...
            sleep 10

            echo Starting the configuration of the system. Keep a patience and DO NOT interrupt the installer.
            sleep 5

            echo Cleaning up all old cached installer data, if any.
            sudo rm -vf /var/lib/apt/lists/*

            echo Updating the installer with the latest fresh dist lists.
            sudo apt update -y  

            echo Installing of building modules in case they are needed of some pkg.
            sudo apt install -y build-essential

            echo Installing of Midnight Commander.
            sudo apt install -y mc

            echo Installing of Network Utilities - the old school way .
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
            ;;
        "Adding Power Management - not for VMs")
            echo Installing of auto-cpufreq tool for power management.
            snap install auto-cpufreq
            sudo auto-cpufreq --install
            ;;
        "Installation of Face Recognition on this Linux Box.")
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
            ;;
        "Installation of Remote Access to this box via NX and SSH.")
            echo Installing NoMachine software for remote access.
            echo Please check for updates and apply them.
            sudo mkdir -p $HOME:/temp/
            sudo cp -Rfp FILES/nomachine_7.7.4_1_amd64.deb $HOME:/temp/
            sudo dpkg -i $HOME:/temp/nomachine_7.7.4_1_amd64.deb
            echo 
            echo Cleaning up.
            sudo rm -rf $HOME:/temp/*
            echo 
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
