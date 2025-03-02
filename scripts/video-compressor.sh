#!/bin/bash

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "Error: ffmpeg is not installed. Install it using 'sudo pacman -S ffmpeg'"
    exit 1
fi

# Get the input file path
read -p "Enter the path of the video file: " input_file

# Check if file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File not found!"
    exit 1
fi

# Ask for bitrate (default 2500k)
read -p "Enter the desired bitrate (e.g., 2500k): " bitrate
bitrate=${bitrate:-2500k}  # Default to 2500k if empty

# Ask for preset (default slow)
read -p "Enter the preset (ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslow) [slow]: " preset
preset=${preset:-slow}  # Default to "slow" if empty

# Generate output filename
output_file="${input_file%.*}_compressed.mp4"

# Run ffmpeg command
ffmpeg -i "$input_file" -c:v libx265 -b:v "$bitrate" -preset "$preset" -c:a aac -b:a 128k "$output_file"

# Print completion message
echo "Compression complete! Output file: $output_file"
