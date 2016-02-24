#!/bin/bash

while true; do
    read -p "Install xrdp? [y/n]: " yn
    case $yn in
        [Yy]* ) pacman -Syu --needed xrdp xf86-video-fbdev xf86-input-synaptics xorg-server xorg-server-utils xorg-xinit mesa xf86-input-keyboard xf86-input-mouse xterm 
		
		echo "Autoboot xrdp at Startup"
		systemctl enable xrdp.service
		systemctl enable xrdp-sesman.service
		
		break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no";;
    esac
done


while true; do
    echo ""
    read -p "Install display manager? [y/n]: " yn
    case $yn in
        [Yy]* )
            while true; do
                echo ""
                read -p "Install and enable [SDDM/LightDM/lxdm/XDM/GDM/nothing]? " dm
                case "$dm" in
                    "SDDM" )
                        pacman -Syu SDDM
                        systemctl enable sddm
                        systemctl start sddm
                    break;;
                    
                    "LightDM" )
                        pacman -Syu lightdm
                        systemctl enable lightdm.service
                        systemctl start lightdm.service
                    break;;
                    
                    "lxdm" )
                        pacman -Syu lxdm
                        systemctl enable lxdm.service
                        systemctl start lxdm.service
                    break;;
                    
                    "LightDM" )
                        pacman -Syu xorg-xdm
                        systemctl enable xdm.service
                        systemctl start xdm.service
                    break;;
                    
                    "GDM" )
                        pacman -Syu gdm
                        systemctl enable gdm.service
                        systemctl start gdm.service
                    break;;
                    
                    "nothing" ) 
                    break;;

                    * ) echo "Please type name display manager or \"nothing\"";
                esac
            done
            break;;
        [Nn]* ) break;;
    esac
done




while true; do
    echo ""
    read -p "Install desktop environment? [y/n]: " yn
    case $yn in
        [Yy]* )
            read -p "Username for change .xinitrc: " username
            cp /etc/X11/xinit/xinitrc /home/"$username"/.xinitrc
            
            while true; do
                echo ""
                read -p "Install [cinnamon/enlightenment/gnome/plasma/lxde/mate/xfce4/nothing]? " env
                case "$env" in
                    "cinnamon" )
                        pacman -Syu cinnamon
                        echo "exec cinnamon-session" >> /home/"$username"/.xinitrc
                    break;;
                    
                    "enlightenment" )	
                        pacman -Syu enlightenment
                        echo "exec enlightenment_start" >> /home/"$username"/.xinitrc
                    break;;
                    
                    "gnome" )	
                        pacman -Syu gnome
                        echo "exec gnome-session" >> /home/"$username"/.xinitrc
                    break;;
                    
                    "plasma" )	
                        pacman -Syu plasma
                        echo "exec startkde" >> /home/"$username"/.xinitrc
                    break;;
                    
                    "lxde" )	
                        pacman -Syu lxde
                        echo "exec startlxde" >> /home/"$username"/.xinitrc
                    break;;
                    
                    "mate" )	
                        pacman -Syu mate
                        echo "exec mate-session" >> /home/"$username"/.xinitrc
                    break;;
                    
                    "xfce4" )	
                        pacman -Syu xfce4
                        echo "exec startxfce4" >> /home/"$username"/.xinitrc
                    break;;
                    
                    "nothing" ) 
                    break;;

                    * ) echo "Please type name desktop environment or \"nothing\"";
                esac
            done
            break;;
        [Nn]* ) break;;
    esac
done




