#!/bin/bash

DOTFILES_DIR="$HOME/Downloads/github/dot-files/.config"
CONFIG_DIR="$HOME/.config"
GTK_THEMES_DIR="$HOME/Downloads/github/dot-files/gtk-themes"
ICONS_DIR="$HOME/Downloads/github/dot-files/.icons"

# Theme selection menu
echo "Select a theme:"
echo "1) Catppuccin"
echo "2) Gruvbox"
read -p "Enter your choice (1 or 2): " choice

# Set theme variables based on choice
case $choice in
    1)
        THEME="catppuccin"
        GTK_THEME="catppuccin-mocha"
        ICON_THEME="Tela-circle-dracula"
        ;;
    2)
        THEME="gruvbox-dark"
        GTK_THEME="Gruvbox-Dark"
        ICON_THEME="Gruvbox-Plus-Dark"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

THEME_DIR="$DOTFILES_DIR/$THEME"

# Verify theme existence
if [[ ! -d "$THEME_DIR" ]]; then
    echo "Theme not found: $THEME"
    exit 1
fi

# List of apps to update
APPS=("kitty" "swaync" "wlogout" "rofi" "waybar" "hypr")

for app in "${APPS[@]}"; do
    rm -rf "$CONFIG_DIR/$app"
    cp -r "$THEME_DIR/$app" "$CONFIG_DIR/$app"
done

# Link GTK-4.0 theme
rm -rf "$CONFIG_DIR/gtk-4.0"
cp -r "$GTK_THEMES_DIR/$GTK_THEME/gtk-4.0" "$CONFIG_DIR/gtk-4.0"

# Link Icons
rm -rf "$HOME/.icons/current-theme"
cp -r "$ICONS_DIR/$ICON_THEME" "$HOME/.icons/current-theme"

# Apply the GTK theme using gsettings
gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"

# Apply the icon theme using gsettings
gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME"

#Reloading waybar swaync css hyprpaper and hyprland
pkill -SIGUSR2 waybar
swaync-client -rs
pkill hyprpaper && hyprpaper &
hyprctl reload

echo "Theme switched to $THEME. Restart apps if needed."
