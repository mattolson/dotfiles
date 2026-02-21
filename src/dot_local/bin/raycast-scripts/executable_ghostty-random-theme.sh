#!/bin/bash

# Required for Raycast Script Commands
# @raycast.schemaVersion 1
# @raycast.title Ghostty
# @raycast.mode silent
# @raycast.icon /Applications/Ghostty.app/Contents/Resources/AppIcon.icns
# @raycast.packageName Ghostty

# Documentation:
# @raycast.description Launch Ghostty with a random theme
# @raycast.author Matt Olson
# @raycast.authorURL https://github.com/mattolson

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/ghostty-themes.sh"

# Pick a random theme
RANDOM_INDEX=$((RANDOM % ${#THEMES[@]}))
SELECTED_THEME="${THEMES[$RANDOM_INDEX]}"

# Write to theme-current
echo "theme = $SELECTED_THEME" > ~/.config/ghostty/theme-current

# Launch Ghostty
open -a Ghostty
