#!/usr/bin/env bash

# add protonfixes
echo "Installing protontricks"
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

echo "Script complete, feel free to exit"
sleep .5
