#!/bin/bash
if [ "$UID" != "0" ]; then
	echo "ERROR: NOT RUNNING AS ROOT!"
	echo "Please run this script as root to have it work correctly!"
	exit 2
fi
# create firmware file for screen and move to grub
mkdir /lib/firmware/edid
base64 --decode ~/gpdwinlinux/winmaxscreen > /lib/firmware/edid/gpdwinmax.bin
echo 'GRUB_CMDLINE_LINUX="video=eDP-1:800x1280 drm.edid_firmware=eDP-1:edid/gpdwinmax.bin fbcon=rotate:1"' >> /etc/default/grub
grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
echo "GPD Win Max firmware installed"
sleep .5
sudo pacman -Syu
echo "grabbing steam, lutris, etc"
sleep 1
sudo pacman -S steam lutris python-pip
pip install protonup
echo "grabbing heroic launcher, flatpak"
sudo yay -Syu heroic-games-launcher-bin
sudo pacman -S flatpak
echo "all good to go!"
sleep 2
