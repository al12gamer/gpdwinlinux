#!/usr/bin/env bash
set -euo pipefail

if [ "$UID" != "0" ]; then
	echo "ERROR: NOT RUNNING AS ROOT!"
	echo "Please run this script as root to have it work correctly!"
	exit 2
fi
# add retroarch
echo "Installing RetroArch"
sleep .5
add-apt-repository ppa:libretro/stable
apt update -y && apt install retroarch* -y

# add protonfixes
echo "Installing protonfixes"
sleep .5
add-apt-repository ppa:jacotsu/protonfixes
apt update -y && apt install protonfixes -y

# add legendary, OSS Epic Games launcher
echo "Installing Legendary, an Epic Games Launcher for Linux"
sleep .5
apt install python3 python3-requests python3-setuptools-git -y
git clone https://github.com/derrod/legendary.git
cd legendary
python3 setup.py install
cd

# add protonup
echo "Grabbing protonup for updating Proton-GE builds easily"
sleep .5
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub net.davidotek.pupgui2
echo "Script complete, feel free to exit"
sleep .5
