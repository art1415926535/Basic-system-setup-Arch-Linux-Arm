su
echo "Install NTP"
pacman -S ntp
systemctl enable ntpd.service
systemctl start ntpd.service

pacman -Syu --needed sudo git python python2 python-pip python2-pip zsh nfs-utils htop openssh alsa-utils alsa-firmware alsa-lib alsa-plugins whet base-devel 
diffutils 

echo "Type username, followed by [ENTER]:"
read username
useradd -d /home/"$username" -m -G wheel -s /usr/bin/zsh "$username"
echo "Type password for new user"
passwd "$username"   

echo "Allow members of group wheel to execute any command"
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers


while true; do
    read -p "Install xrdp?" yn
    case $yn in
        [Yy]* ) pacman -Syu --needed xrdp xf86-video-fbdev xf86-input-synaptics xorg-server xorg-server-utils xorg-xinit mesa xf86-input-keyboard xf86-input-mouse 
xterm 
		
		echo "Autoboot xrdp at Startup"
		systemctl enable xrdp.service
		systemctl enable xrdp-sesman.service
		
		break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no";;
    esac
done


while true; do
	read -p "Install desktop environment?" yn
	case $yn in
	    [Yy]* )

		cp /etc/X11/xinit/xinitrc /home/"$username"/.xinitrc
		
		while true; do
		    read -p "Install cinnamon/enlightenment/gnome/plasma/lxde/mate/xfce4/nothing?" env
		    case "$evn" in
		        "cinnamon" )
				pacman -Syu cinnamon
				"exec cinnamon-session" >> /home/"$username"/.xinitrc
			break;;
		        
		        "enlightenment" )	
				pacman -Syu enlightenment
				"exec enlightenment_start" >> /home/"$username"/.xinitrc
			break;;
		        
		        "gnome" )	
				pacman -Syu gnome
				"exec gnome-session" >> /home/"$username"/.xinitrc
			break;;
		        
		        "plasma" )	
				pacman -Syu plasma
				"exec startkde" >> /home/"$username"/.xinitrc
			break;;
		        
		        "lxde" )	
				pacman -Syu lxde
				"exec startlxde" >> /home/"$username"/.xinitrc
			break;;
			
		        "mate" )	
				pacman -Syu mate
				"exec mate-session" >> /home/"$username"/.xinitrc
			break;;
		        
		        "xfce4" )	
				pacman -Syu xfc4
				"exec startxfce4" >> /home/"$username"/.xinitrc
			break;;
		        
			"nothing" ) 
			break;;

		        * ) echo "Please type name desktop environment or \"nothing\"";;
		    esac
		done
	    [Nn]* ) break;;
	esac
done




