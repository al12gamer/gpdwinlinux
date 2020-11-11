#!/bin/bash
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

# add proton-ge-updater
echo "Grabbing script for updating Proton-GE builds easily"
sleep .5
apt install curl unzip -y
git clone https://github.com/die-zuckerschnecke/proton-ge-custom-updater.git
cd ~/proton-ge-custom-updater
# We have to use the username for the user we want to become since we are running as root
# Best way to do that is reading /etc/passwd and getting the username for UID 1000
su $(grep '1000' /etc/passwd | sed 's/:/ /g' | awk '{print $1}') -c bash ./proton-ge-custom-updater.sh
echo "In the future, please open the proton-ge-custom-updater folder and run the script if you want a newer GloriousEggroll proton version"
sleep 1
echo "Script complete, feel free to exit"
sleep .5
