
#!/usr/bin/env bash

# create firmware file for screen and move to grub
mkdir /lib/firmware/edid
# Solus USES CLR Instead....need fixing base64 --decode ~/gpdwinlinux/winmaxscreen > /lib/firmware/edid/gpdwinmax.bin
# change for CLR echo 'GRUB_CMDLINE_LINUX="video=eDP-1:800x1280 drm.edid_firmware=eDP-1:edid/gpdwinmax.bin fbcon=rotate:1"' >> etc/kernel/cmdline
# clr-boot-manager update
# echo "GPD Win Max firmware installed"
# sleep .5

# install gaming packages and nvidia drivers
echo "installing steam etc..."
sleep .5
eopkg install steam lutris wine vim neofetch gamemode gnome-tweaks -y

# update repositories

eopkg upgrade -y

echo "Script complete, please reboot!"
sleep 1
