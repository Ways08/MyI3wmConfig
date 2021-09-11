#!/bin/bash

#arch apps installation
sudo pacman -Suy nvidia-dkms curl nvidia-utils rofi i3 i3-gaps xorg zsh xorg-xdm dmenu i3status i3lock ttf-dejavu alacritty
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R tecmint:tecmint ./yay-git
cd yay-git
makepkg -si
yay -Syu --devel --timeupdate
cd ~/
yay -S polybar
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#copying
mkdir -p ~/.config
cp ~/dots/i3 ~/.config/
cp ~/dots/gtk-* ~/.config/
cp ~/dots/nitrogen ~/.config/
cp ~/dots/polybar ~/.config/
cp ~/dots/rofi ~/.config/
cp ~/dots/alacritty ~/.config/
mkdir -p ~/Pictures
cp ~/dots/Pictures/* ~/Pictures/
