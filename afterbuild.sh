#!/bin/sh

# stuff that i couldn't do with nixos config
curl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash
# flatpak
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons
sudo flatpak override --env=GTK_THEME=adw-gtk3-dark 
sudo flatpak override --env=ICON_THEME=Adwaita-hacks 