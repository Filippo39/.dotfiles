#!/bin/bash

# Path to the custom image
custom_image="/home/filippo/Immagini/NitrogenWallpaper/rickMortyLock.png"

# Take a screenshot of the entire multi-monitor setup
scrot /tmp/screen.png

# Blur the screenshot
convert /tmp/screen.png -blur 0x8 /tmp/screen_blur.png

# Get monitor information
monitor_info=$(xrandr --query | grep ' connected')
monitor_count=$(echo "$monitor_info" | wc -l)

# Function to resize and center the image on a monitor
center_image_on_monitor() {
  local monitor_dimensions=$1
  
  local monitor_x=$(echo $monitor_dimensions | grep -oP '\+\K[0-9]+(?=\+|$)' | head -n 1)
  local monitor_y=$(echo $monitor_dimensions | grep -oP '\+\K[0-9]+(?=$)' | tail -n 1)
  local monitor_width=$(echo $monitor_dimensions | grep -oP '^[0-9]+(?=x)')
  local monitor_height=$(echo $monitor_dimensions | grep -oP '(?<=x)[0-9]+(?=\+)')

  # Resize the custom image if it is larger than the monitor, while maintaining the aspect ratio
  convert "$custom_image" -resize "${monitor_width}x${monitor_height}>" /tmp/custom_image_resized.png

  # Check if resizing was successful
  if [ ! -f /tmp/custom_image_resized.png ]; then
    echo "Error: Resized custom image not found."
    exit 1
  fi

  # Get the dimensions of the resized custom image
  local resized_width=$(identify -format "%w" /tmp/custom_image_resized.png)
  local resized_height=$(identify -format "%h" /tmp/custom_image_resized.png)

  # Calculate the position to center the image on the monitor
  local pos_x=$((monitor_x + (monitor_width - resized_width) / 2))
  local pos_y=$((monitor_y + (monitor_height - resized_height) / 2))

  # Overlay the custom image on the blurred screenshot, centered on the monitor
  cp /tmp/screen_combined.png /tmp/screen_combined_tmp.png
  convert /tmp/screen_combined_tmp.png /tmp/custom_image_resized.png -geometry +$pos_x+$pos_y -composite /tmp/screen_combined.png

  # Remove the temporary resized custom image
  rm /tmp/custom_image_resized.png
  rm /tmp/screen_combined_tmp.png
}

# Initialize the combined image with the blurred screenshot
cp /tmp/screen_blur.png /tmp/screen_combined.png

if [ $monitor_count -eq 2 ]; then
  # Use the second monitor
  second_monitor=$(echo "$monitor_info" | tail -n 1 | awk '{print $3}')
  center_image_on_monitor $second_monitor
else
  # Use the primary monitor
  primary_monitor=$(echo "$monitor_info" | head -n 1 | awk '{print $4}')
  center_image_on_monitor $primary_monitor
fi

# Lock the screen with the combined image
i3lock -i /tmp/screen_combined.png

# Remove the temporary images
rm /tmp/screen.png /tmp/screen_blur.png /tmp/screen_combined.png
