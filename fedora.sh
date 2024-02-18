#!/bin/bash
if [ "$UID" != "0" ]; then
	echo "ERROR: NOT RUNNING AS ROOT!"
	echo "Please run this script as root to have it work correctly!"
	exit 2
fi
# create firmware file for screen and move to grub
mkdir /lib/firmware/edid
base64 --decode ~/gpdwinlinux/winmaxscreen > /lib/firmware/edid/gpdwinmax.bin
echo 'GRUB_CMDLINE_LINUX="video=eDP-1:1080x1920 drm.edid_firmware=eDP-1:edid/gpdwinmax.bin fbcon=rotate:1"' >> /etc/default/grub
grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
echo "GPD firmware installed"
sleep .5

# enable rpmfusion
echo "installing extra repos and gaming packages"
sleep 2
dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# enable eggy's suggestions for better gaming performance by default
sudo dnf copr enable gloriouseggroll/mesa-aco -yq

# update repositories

dnf check-update -y

dnf groupupdate core -y

# install multimedia packages
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -yq

sudo dnf groupupdate sound-and-video -yq

# fedora better fonts
sudo dnf copr enable dawid/better_fonts -yq
sudo dnf install fontconfig-enhanced-defaults fontconfig-font-replacements -yq

# install some basic stuff you would need otherwise
sudo dnf install steam lutris wine vim neofetch gamemode gnome-tweaks -y


# upgrade packages
sudo dnf distro-sync -y && sudo dnf update --refresh -y && sudo dnf autoremove -y && flatpak update -y && flatpak remove --unused 

read -p "Would you like to install the extras? [Y/n]: " ans
if [ "$ans" == "Y" ] || [ "$ans" == "y" ]; then
	./fedora_extras.sh
fi

echo "Script complete, please reboot!"
sleep 1
