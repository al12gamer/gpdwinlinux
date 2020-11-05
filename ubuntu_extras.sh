#!/usr/bin/env bash

# add retroarch
echo "Installing RetroArch"
sleep .5
sudo add-apt-repository ppa:libretro/stable
sudo apt update -y && sudo apt install retroarch* -y

# add protonfixes
echo "Installing protonfixes"
sleep .5
sudo add-apt-repository ppa:jacotsu/protonfixes
sudo apt update -y && sudo apt install protonfixes -y

# add proton-ge-updater
echo "Grabbing script for updating Proton-GE builds easily"
sleep .5
sudo apt install curl unzip -y
git clone https://github.com/die-zuckerschnecke/proton-ge-custom-updater.git
cd ~/proton-ge-custom-updater
bash ./proton-ge-custom-updater.sh
echo "In the future, please open the proton-ge-custom-updater folder and run the script if you want a newer GloriousEggroll proton version"
sleep 1
echo "Script complete, feel free to exit"
sleep .5
