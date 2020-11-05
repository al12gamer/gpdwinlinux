#!/usr/bin/env bash

# create firmware file for screen and move to grub
mkdir /lib/firmware/edid
base64 --decode ~/gpdwinlinux/winmaxscreen > /lib/firmware/edid/gpdwinmax.bin
echo 'GRUB_CMDLINE_LINUX="video=eDP-1:800x1280 drm.edid_firmware=eDP-1:edid/gpdwinmax.bin fbcon=rotate:1"' >> /etc/default/grub
sudo update-grub
echo "GPD Win Max screen firmware installed"
sleep .5

# check drivers and required repos
echo "Installing extra repos and gaming packages"
sleep .5

sudo add-apt-repository ppa:lutris-team/lutris

# install some basic stuff you would need otherwise
sudo apt update -y
sudo apt install steam-installer meson lutris vim neofetch gamemode gnome-tweaks -y
# meson may be needed to build gamemode in the future if it still isn't in main repos

# upgrade packages
sudo apt update -y && sudo apt upgrade -y

echo "Script complete, please reboot!"
sleep 1
