#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
INDEX_FILE="${SCRIPT_DIR}/wlppr.index"
WALLPAPER_CONF="${SCRIPT_DIR}/wlppr.conf"
MODE="fill"

# Create wallpaper directory if needed
mkdir -p "$WALLPAPER_DIR"

# Get sorted list of images
mapfile -t IMAGES < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.jxl" \) | sort)

# Exit if no wallpapers found
if [ ${#IMAGES[@]} -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    echo "Add images to this directory and try again."
    exit 1
fi

# Initialize index file if it doesn't exist
if [ ! -f "$INDEX_FILE" ]; then
    echo "0" > "$INDEX_FILE"
fi

# Read current index
CURRENT_INDEX=$(cat "$INDEX_FILE")
TOTAL=${#IMAGES[@]}

# Determine new index
case "$1" in
    next)
        NEW_INDEX=$(( (CURRENT_INDEX + 1) % TOTAL ))
        ;;
    prev)
        NEW_INDEX=$(( (CURRENT_INDEX - 1 + TOTAL) % TOTAL ))
        ;;
    *)
        echo "Usage: $0 {next|prev}"
        exit 1
        ;;
esac

# Save new index
echo "$NEW_INDEX" > "$INDEX_FILE"

# Update config and apply
NEW_WALLPAPER="${IMAGES[NEW_INDEX]}"
echo "output * bg \"$NEW_WALLPAPER\" $MODE" > "$WALLPAPER_CONF"
swaymsg output '*' bg "${IMAGES[NEW_INDEX]}" "$MODE"

echo "Wallpaper changed to: $NEW_WALLPAPER"
echo "(Persistent across config reloads)"