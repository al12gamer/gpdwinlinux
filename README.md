# Post-Install Scripts for GPD Win Devices
These scripts should be able to get you up and running as quickly as possible after installing the associated distros. I will name them according to the device as well. I plan on getting newer devices in the future, starting after the GPD Win Max.
## Quick Start
The script assumes you are `git clone` -ing into your user directory. Each script is named for the associated linux distro. Below is an example of running the Fedora script...which you will need to run as root due to the display firmware file.
```bash
sudo su
git clone https://github.com/al12gamer/gpdwinlinux.git
cd gpdwinlinux
chmod +x fedora_winmax.sh
./fedora_winmax.sh
```
Feel free to look over my bash script if you are uncomfortable running it as root- have had troubles in the past with sudo not properly installing the screen firmware for the win max.
### ProtonUpdater And RetroArch
Run these as a normal user.
If you want the awesome [ProtonUpdater](https://copr.fedorainfracloud.org/coprs/david35mm/ProtonUpdater/) package on Fedora so that you can just run `ProtonUpdater` in terminal when you want to check for a newer version of GloriousEggroll's forks of Valve Proton, along with RetroArch, please run 
```
cd gpdwinlinux
chmod +x fedora_extras.sh
./fedora_extras.sh
```
The Ubuntu Extras script installs Proton fixes and the [Proton GE Updater](https://github.com/die-zuckerschnecke/proton-ge-custom-updater), as well as adds the PPA for RetroArch and installs it.
