#!/bin/bash

# Script to start Sonarr, Prowlarr, and Radarr services

# Start Sonarr
echo "Starting Sonarr service..."
sudo systemctl start sonarr
if [ $? -eq 0 ]; then
    echo "Sonarr started successfully."
else
    echo "Failed to start Sonarr."
fi

# Start Prowlarr
echo "Starting Prowlarr service..."
sudo systemctl start prowlarr
if [ $? -eq 0 ]; then
    echo "Prowlarr started successfully."
else
    echo "Failed to start Prowlarr."
fi

# Start Radarr
echo "Starting Radarr service..."
sudo systemctl start radarr
if [ $? -eq 0 ]; then
    echo "Radarr started successfully."
else
    echo "Failed to start Radarr."
fi

echo "All services attempted to start."
