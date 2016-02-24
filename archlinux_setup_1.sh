loadkeys ru
echo LANG=ru_RU.UTF-8 > /etc/locale.conf
echo KEYMAP=de-latin1-nodeadkeys > /etc/vconsole.conf
rm /etc/localtime
ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8

fallocate -l 1024M /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo 'vm.swappiness=1' > /etc/sysctl.d/99-sysctl.conf
echo "/swapfile none swap defaults 0 0" >> /etc/fstab

timedatectl set-local-rtc 0
echo "Europe/Moscow" > /etc/timezone

sed -i 's/#Color/Color/' /etc/pacman.conf

pacman -Sy pacman
pacman-key --init
pacman -S archlinux-keyring
pacman-key --populate archlinux
pacman -Syu --ignore filesystem
pacman -S filesystem --force

reboot
