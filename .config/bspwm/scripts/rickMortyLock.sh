#!/bin/bash

# Percorso all'immagine personalizzata
custom_image="/home/filippo/Immagini/NitrogenWallpaper/rickMortyLock.png"

# Prendi uno screenshot dell'intero setup multi-monitor
scrot /tmp/screen.png

# Sfoca l'immagine
convert /tmp/screen.png -blur 0x5 /tmp/screen_blur.png

# Ottieni informazioni sui monitor
monitor_info=$(xrandr --query | grep ' connected')

# Conta il numero di monitor connessi
monitor_count=$(echo "$monitor_info" | wc -l)

if [ $monitor_count -eq 2 ]; then
  # Ottieni le dimensioni e la posizione del secondo monitor
  second_monitor=$(echo "$monitor_info" | tail -n 1 | awk '{print $3}')
  second_monitor_width=$(echo $second_monitor | cut -d'x' -f1)
  second_monitor_height=$(echo $second_monitor | cut -d'x' -f2 | cut -d'+' -f1)
  second_monitor_x=$(echo $second_monitor | cut -d'+' -f2)
  second_monitor_y=$(echo $second_monitor | cut -d'+' -f3)

  # Sovrapponi l'immagine personalizzata sul secondo monitor
  convert /tmp/screen_blur.png "$custom_image" -geometry +$second_monitor_x+$second_monitor_y -composite /tmp/screen_combined.png
else
  # Usa solo l'immagine sfocata se c'è un solo monitor
  cp /tmp/screen_blur.png /tmp/screen_combined.png
fi

# Blocca lo schermo con l'immagine combinata
i3lock -i /tmp/screen_combined.png

# Rimuovi le immagini temporanee
rm /tmp/screen.png /tmp/screen_blur.png /tmp/screen_combined.png
