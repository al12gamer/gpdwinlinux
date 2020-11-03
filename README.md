# Post-Install Scripts for GPD Win Devices
These scripts should be able to get you up and running as quickly as possible after installing the associated distros.
## Quick Start
The script assumes you are `git clone` -ing into your user directory. Each script is named for the associated linux distro. Working on testing these more and will update soon with fixes and cleanup. Below is an example of running the Fedora script.
```bash
git clone https://github.com/al12gamer/gpdwinlinux.git
cd gpdwinlinux
chmod +x fedora_winmax.sh
./fedora_winmax.sh
```
### ProtonUpdater And RetroArch For Fedora
I'm automating the installing of the awesome and simple [ProtonUpdater](https://copr.fedorainfracloud.org/coprs/david35mm/ProtonUpdater/) package so that you can just run `ProtonUpdater` in terminal when you want to check for a newer version of GloriousEggroll's forks of Valve Proton. It is recommended to run this command after running the post install script. Also installing the flatpak of RetroArch.
