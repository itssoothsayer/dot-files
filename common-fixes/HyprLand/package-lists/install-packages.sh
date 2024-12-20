#!/bin/bash

# Update and install pacman packages
echo "Installing pacman packages..."
sudo pacman -Syu --needed - < pacman_packages.txt

# Install yay packages
echo "Installing yay packages..."
yay -Syu --needed - < yay_packages.txt

# Install flatpak apps
echo "Installing flatpak apps..."
cat flatpak_apps.txt | while read app; do flatpak install -y $app; done

echo "Installation complete!"
