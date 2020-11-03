#!/usr/bin/env bash

# create firmware file for screen and move to grub
sudo mkdir /lib/firmware/edid
base64 --decode ~/gpdwinlinux/winmaxscreen.txt > /lib/firmware/edid/gpdwinmax.bin
echo 'GRUB_CMDLINE_LINUX="video=eDP-1:800x1280 drm.edid_firmware=eDP-1:edid/gpdwinmax.bin fbcon=rotate:1"' >> /etc/default/grub
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
echo "GPD Win Max firmware installed"
sleep .5

# gnome settings
echo "enabling dark mode in gui"
sleep .5
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

# enable rpmfusion
echo "installing extra repos and gaming packages"
sleep .5
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -yq

sudo dnf groupupdate core -y

# install some basic stuff to get gaming
sudo dnf install steam lutris wine vim gamemode -y

# add flathub and retroarch
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub org.libretro.RetroArch

# add third party software

# add Proton Updater from COPR
echo "adding protonupdater"
sleep .5
sudo dnf copr enable david35mm/ProtonUpdater -y
sudo dnf install ProtonUpdater -y

# update repositories

sudo dnf check-update -y

# upgrade packages
sudo dnf upgrade -y
sudo dnf autoremove -y
echo "Script complete, please reboot!"
