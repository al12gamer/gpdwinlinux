#!/usr/bin/env bash

# add flathub and retroarch
echo "Adding flathub, installing RetroArch"
sleep .5
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.libretro.RetroArch

# add Proton Updater from COPR
echo "Grabbing the awesome ProtonUpdater package"
sleep .5
sudo dnf copr enable david35mm/ProtonUpdater -y
sudo dnf update -y
sudo dnf install ProtonUpdater -y

echo "Script complete! Feel fre to exit."
sleep .5
