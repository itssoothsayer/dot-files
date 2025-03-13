#!/bin/bash

# Check if HDMI-A-1 is connected
if hyprctl monitors | grep -q "HDMI-A-1"; then
  echo "HDMI-A-1 detected. Disabling eDP-1..."
  hyprctl keyword monitor eDP-1,disable && echo "eDP-1 has been disabled."
else
  echo "HDMI-A-1 is not connected. Keeping eDP-1 enabled."
fi
