#!/bin/bash

# Required for Raycast Script Commands
# @raycast.schemaVersion 1
# @raycast.title Ghostty Next Theme
# @raycast.mode silent
# @raycast.icon /Applications/Ghostty.app/Contents/Resources/AppIcon.icns
# @raycast.packageName Ghostty

# Documentation:
# @raycast.description Cycle to the next Ghostty theme
# @raycast.author Matt Olson
# @raycast.authorURL https://github.com/mattolson

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/ghostty-themes.sh"

THEME_FILE="$HOME/.config/ghostty/theme-current"
CURRENT_THEME=""

# Read current theme from the config file
if [[ -f "$THEME_FILE" ]]; then
  CURRENT_THEME=$(sed -n 's/^theme = //p' "$THEME_FILE")
fi

# Find the index of the current theme
CURRENT_INDEX=-1
for i in "${!THEMES[@]}"; do
  if [[ "${THEMES[$i]}" == "$CURRENT_THEME" ]]; then
    CURRENT_INDEX=$i
    break
  fi
done

# Pick the next theme, wrapping to 0 at the end
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#THEMES[@]} ))
SELECTED_THEME="${THEMES[$NEXT_INDEX]}"

echo "theme = $SELECTED_THEME" > "$THEME_FILE"

# Trigger Ghostty to reload its config
kill -SIGUSR2 $(ps -xo pid,comm | awk '/ghostty$/ {print $1}') 2>/dev/null

echo "$SELECTED_THEME"
