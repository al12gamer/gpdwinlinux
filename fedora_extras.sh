#!/bin/bash
if [ "$UID" != "0" ]; then
	echo "ERROR: NOT RUNNING AS ROOT!"
	echo "Please run this script as root to have it work correctly!"
	exit 2
fi
# add flathub and retroarch
echo "Adding flathub, installing RetroArch"
sleep .5
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.libretro.RetroArch

# add Proton Updater from COPR
echo "Grabbing the awesome ProtonUpdater package"
sleep .5
dnf copr enable david35mm/ProtonUpdater -y
dnf update -y
dnf install ProtonUpdater -y

# add Legendary, open source reimplementation of Epic Games Launcher
echo "Grabbing an open source implementation of the Epic Games Launcher, Legendary"
sleep .5
dnf install legendary -y

echo "Script complete! Feel free to exit."
sleep .5
