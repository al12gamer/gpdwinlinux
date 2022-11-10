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
grub-mkconfig -o /boot/grub/grub.cfg
echo "GPD Win Max firmware installed"
sleep 2
sudo pacman -Syu --noconfirm
echo "grabbing steam, lutris, etc"
sleep 2
sudo pacman -S steam lutris python-pip --noconfirm
pip install protonup
echo "grabbing heroic launcher, flatpak protonup"
sudo yay -S heroic-games-launcher-bin
sudo pacman -S flatpak --noconfirm
flatpak install flathub net.davidotek.pupgui2
echo "all good to go!"
sleep 2
sudo pacman --sync --refresh --noconfirm
sudo pacman --sync --needed archlinux-keyring --noconfirm
sudo pacman -Syu --noconfirm
