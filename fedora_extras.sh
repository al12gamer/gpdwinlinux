#!/usr/bin/env bash

# add flathub and retroarch
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.libretro.RetroArch

# add third party software

# add Proton Updater from COPR
sudo dnf copr enable david35mm/ProtonUpdater -y
sudo dnf install ProtonUpdater -y
sudo dnf update -y
