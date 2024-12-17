#!/bin/bash

# Open Kitty terminal and execute the script inside it
kitty --title "Monitor Status" bash -c '
  # Check if HDMI-A-1 is connected
  monitor_status=$(hyprctl monitors | grep "HDMI-A-1")

  # If HDMI-A-1 is connected, prompt the user
    if [[ -n "$monitor_status" ]]; then
    # Ask the user if they want to disable eDP-1 (laptop internal display)
    read -p "HDMI-A-1 is connected. Do you want to disable eDP-1 (laptop screen)? (y/n): " response
    if [[ "$response" == "y" || "$response" == "Y" ]]; then
      # Disable eDP-1 (laptop internal display)
	hyprctl keyword monitor eDP-1,disable
      echo "eDP-1 has been disabled."
    else
      echo "Both displays are active. For more settings, check the ~/.config/hypr/hyprland.conf"
    fi
  else
    echo "HDMI-A-1 is not connected."
  fi
  read -p "Press any key to close this terminal..."
'
