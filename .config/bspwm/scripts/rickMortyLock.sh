#!/bin/bash

# Percorso all'immagine personalizzata
custom_image="/home/filippo/Immagini/NitrogenWallpaper/rickMortyLock.png"

# Take a screenshot of the entire multi-monitor setup
scrot /tmp/screen.png

# Blur the screenshot
convert /tmp/screen.png -blur 0x5 /tmp/screen_blur.png

# Get monitor information
monitor_info=$(xrandr --query | grep ' connected')

# Count the number of connected monitors
monitor_count=$(echo "$monitor_info" | wc -l)

if [ $monitor_count -eq 2 ]; then
  # Get the dimensions and position of the second monitor
  second_monitor=$(echo "$monitor_info" | tail -n 1 | awk '{print $3}')
  second_monitor_width=$(echo $second_monitor | cut -d'x' -f1)
  second_monitor_height=$(echo $second_monitor | cut -d'x' -f2 | cut -d'+' -f1)
  second_monitor_x=$(echo $second_monitor | cut -d'+' -f2)
  second_monitor_y=$(echo $second_monitor | cut -d'+' -f3)

  # Resize the custom image if it is larger than the second monitor, while maintaining the aspect ratio
  convert "$custom_image" -resize "${second_monitor_width}x${second_monitor_height}>" /tmp/custom_image_resized.png

  # Get the dimensions of the resized custom image
  resized_width=$(identify -format "%w" /tmp/custom_image_resized.png)
  resized_height=$(identify -format "%h" /tmp/custom_image_resized.png)

  # Calculate the position to center the image on the second monitor
  pos_x=$((second_monitor_x + (second_monitor_width - resized_width) / 2))
  pos_y=$((second_monitor_y + (second_monitor_height - resized_height) / 2))

  # Overlay the custom image on the blurred screenshot, centered on the second monitor
  convert /tmp/screen_blur.png /tmp/custom_image_resized.png -geometry +$pos_x+$pos_y -composite /tmp/screen_combined.png

  # Remove the temporary resized custom image
  rm /tmp/custom_image_resized.png
else
  # Use only the blurred image if there's only one monitor
  cp /tmp/screen_blur.png /tmp/screen_combined.png
fi

# Lock the screen with the combined image
i3lock -i /tmp/screen_combined.png

# Remove the temporary images
rm /tmp/screen.png /tmp/screen_blur.png /tmp/screen_combined.png
