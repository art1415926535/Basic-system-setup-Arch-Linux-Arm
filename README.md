------------------------
# Basic system setup Arch Linux Arm
------------------------

## What you will need:
* Raspberry Pi (v1 or v2) with installed Arch Linux Arm. 
<br>(Installer: https://github.com/art1415926535/Installer-Arch-Linux-for-Raspberry-Pi)
* Internet on Raspberry Pi

------------------------
# Guide 
##0. Download this repository
```
git clone https://github.com/art1415926535/Basic-system-setup-Arch-Linux-Arm.git
cd Basic-system-setup-Arch-Linux-Arm
```
<br>

##1. Run first script
```
su
chmod +x script_1.sh && ./script_1.sh
```
**What it's doing:**
* Keyboard configuration (ru)
* Configuration localtime (Moscow)
* locale-gen
* Add swapfile
* Set hardware clock to UTC and set timezone
* Add color to pacman
* System update
In last line of script has `reboot`
<br>

##2. Run second script
```
su
chmod +x script_2.sh && ./script_2.sh
```
**What it's doing:**
* NTP
* Install `sudo git python python2 python-pip python2-pip zsh nfs-utils htop openssh alsa-utils alsa-firmware alsa-lib alsa-plugins whet base-devel diffutils`
* Create new user
* Allow members of group wheel to execute any command (remove "#" in /etc/sudoers)
<br>

##3. Run third script
```
su
chmod +x script_3.sh && ./script_3.sh
```
**What it's doing:**
* Install xrdp: `xrdp xf86-video-fbdev xf86-input-synaptics xorg-server xorg-server-utils xorg-xinit mesa xf86-input-keyboard xf86-input-mouse xterm `
* Install desktop environment: `cinnamon / enlightenment / gnome / plasma / lxde / mate / xfce4`
* Add line `exec some_env` in ~/.xinitrc
<br>

------------------------

### Sources:
* My experiences
* https://wiki.archlinux.org
* https://github.com/phortx/Raspberry-Pi-Setup-Guide
