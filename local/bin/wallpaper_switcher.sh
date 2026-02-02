#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/wallpapers/"

selected_basename=$(
  find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" \) | sort | while read -r file; do
    # Format the output for Rofi: Display Name \0icon\x1fthumbnail://FullPath
    echo -en "$(basename "$file")\0icon\x1fthumbnail://$file\n"
  done | rofi -dmenu \
    -config ~/.config/rofi/themes/wallpaper_preview.rasi \
    show-icons \
    markup-rows \
    -i
)

# Check if a selection was made
if [ -n "$selected_basename" ]; then
  # Reconstruct the full path from the base name
  FULL_PATH="$WALLPAPER_DIR/$selected_basename"

  # Set the wallpaper using swww
  swww img "$FULL_PATH" --transition-type none
fi
