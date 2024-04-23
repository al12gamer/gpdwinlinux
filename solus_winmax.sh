#!/usr/bin/env bash
set -euo pipefail

if [ "$UID" != "0" ]; then
	echo "ERROR: NOT RUNNING AS ROOT!"
	echo "Please run this script as root to have it work correctly!"
	exit 2
fi
# create firmware file for screen, as well as folder to hold command line options and move to CBM
mkdir -p /lib/firmware/edid /etc/kernel/cmdline.d
# Standard firmware should work just fine
base64 --decode ~/gpdwinlinux/winmaxscreen > /lib/firmware/edid/gpdwinmax.bin
echo 'video=eDP-1:800x1280 drm.edid_firmware=eDP-1:edid/gpdwinmax.bin fbcon=rotate:1' > /etc/kernel/cmdline.d/gpdwinlinux.conf
clr-boot-manager update
echo "GPD Win Max firmware installed"
sleep 1

# install gaming packages
echo "installing steam etc..."
sleep 2
eopkg update-repo
eopkg install steam lutris wine vim neofetch gamemode winetricks python3 pip -y

# add protonup
pip install protonup
echo "protonup installed, run protonup in your terminal to get newer proton-ge releases"
sleep 2
# update repositories

eopkg upgrade -y

echo "Script complete, please reboot!"
sleep 1
