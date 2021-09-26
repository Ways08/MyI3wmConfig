#!/bin/bash

#arch apps installation
sudo pacman -Suy nvidia-dkms curl nvidia-utils pcmanfm rofi i3 polkit lxsession i3-gaps xorg zsh xorg-xdm dmenu i3status i3lock ttf-dejavu alacritty dhcpcd neofetch
echo “exec i3” > ~/.xsession
chmod +x ~/.xsession
sudo systemctl enable xdm.service

cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R tecmint:tecmint ./yay-git
cd yay-git
makepkg -si
yay -Syu --devel --timeupdate
cd ~/
yay -S polybar
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#removing
rm -rf ~/.config/i3
rm -rf ~/.config/gtk*
rm -rf ~/.config/nitrogen
rm -rf ~/.config/rofi
rm -rf ~/.config/polybar
rm -rf ~/.config/alacritty

#copying
mkdir -p ~/.config
mkdir -p ~/.themes
mkdir -p ~/.icons
tar -xf Nordic.tar.gz
tar -xf Nordic-icons.tar.gz
cp -r Nordic ~/.themes/
cp -r ~/MyI3wmConfig/Nordic-Darker ~/.icons/
cp ~/MyI3wmConfig/zshcfg ~/.zshrc
cp ~/MyI3wmConfig/i3 ~/.config/
cp ~/MyI3wmConfig/gtk-* ~/.config/
cp ~/MyI3wmConfig/nitrogen ~/.config/
cp ~/MyI3wmConfig/polybar ~/.config/
cp ~/MyI3wmConfig/rofi ~/.config/
cp ~/MyI3wmConfig/alacritty ~/.config/
mkdir -p ~/Pictures
cp ~/MyI3wmConfig/Pictures/* ~/Pictures/

#cust 
clear && neofetch && printf "\n\n\n\nDONE"
sleep 5
reboot
