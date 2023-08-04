# Post-Install Scripts for GPD Win Devices
These scripts should be able to get you up and running as quickly as possible after installing the associated distros. I will name them according to the device as well. I plan on getting newer devices in the future, starting after the GPD Win Max, but no promises.  Please note that Arch or Arch derivatives seem to be the easiest to get patched and running on the original GPD Win Max at this time.
## Quick Start
The script assumes you are `git clone` -ing into your user directory. Each script is named for the associated linux distro. Below is an example of running the Fedora script...which you will need to run as root due to the display firmware file.
Don't forget to install Git!
```bash
git clone https://github.com/al12gamer/gpdwinlinux.git
cd gpdwinlinux
sudo ./fedora_winmax.sh
```
Feel free to look over my bash script if you are uncomfortable running it as root- have had troubles in the past with sudo not properly installing the screen firmware for the win max.

Alternatively, you can simply run:

`sudo ./gpdwinlinux.sh`

This script will detect which distro you are running and attempt to run the correct file for you.
If you are on a derivative distro such as Pop!_OS, you need to run the script for your parent distro manually.
This script may point you to the correct script to run, if you are at all unsure.

### ProtonUpdater And RetroArch
If you want the awesome [protonup](https://flathub.org/apps/details/net.davidotek.pupgui2) package on Fedora so that you can use a point and click app to check for a newer version of GloriousEggroll's forks of Valve Proton, along with RetroArch, please run... 
```
cd gpdwinlinux
sudo ./fedora_extras.sh
```
The Ubuntu Extras script installs [protonup](https://flathub.org/apps/details/net.davidotek.pupgui2), as well as adds the PPA for RetroArch and installs it.

# Tested on
- [x] 2020 GPD Win Max
- [ ] 2023 GPD Win Mini
