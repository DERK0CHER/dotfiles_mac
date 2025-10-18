#!/bin/bash
# dynamic-split.sh
# This script inspects the focused window’s geometry (via yabai) and splits it:
# - If the window is taller than it is wide, split horizontally (new window on the bottom).
# - Otherwise, split vertically (new window to the right).

# Query the currently focused window’s frame.
window_info=$(yabai -m query --windows --window)

# Use jq to extract width (w) and height (h).
width=$(echo "$window_info" | jq '.frame.w')
height=$(echo "$window_info" | jq '.frame.h')

# Debug: Uncomment to see dimensions
# echo "Width: $width, Height: $height" >&2

# Compare height and width using bc (floating-point comparison)
if (( $(echo "$height > $width" | bc -l) )); then
    # Taller than wide: split horizontally (new window goes to the bottom)
    yabai -m window --split bottom
else
    # Wider than tall: split vertically (new window goes to the right)
    yabai -m window --split right
fi
