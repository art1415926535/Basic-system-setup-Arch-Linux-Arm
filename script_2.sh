#!/bin/bash

pacman -S --needed ntp
systemctl enable ntpd.service
systemctl start ntpd.service

pacman -Syu --needed sudo git python python2 python-pip python2-pip zsh nfs-utils htop openssh alsa-utils alsa-firmware alsa-lib alsa-plugins wget base-devel diffutils 

echo ""
echo "Type username, followed by [ENTER]:"
read username
useradd -d /home/"$username" -m -G wheel -s /usr/bin/zsh "$username"
echo "Type password for new user"
passwd "$username"   

echo "Allow members of group wheel to execute any command"
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers

