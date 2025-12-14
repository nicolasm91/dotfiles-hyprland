#!/usr/bin/env bash
# optional: wait a tiny bit so the wallpaper set completes
sleep 0.1

#!/usr/bin/env bash
WALLPAPER="$1"

# Generate pywal colors from the new wallpaper
wal -i "$WALLPAPER"

killall waybar && waybar &
killall swayosd-server && exec swayosd-server &

# kill the Waypaper window
pkill -x waypaper

# reload styles sway-nc
sleep 0.5
swaync-client -rs

# Create symlink
ln -sf "$WALLPAPER" ~/.config/hypr/current-wallpaper