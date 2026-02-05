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

THEMES=(
  "Belafonte Night"
  "Black Metal"
  "Catppuccin Mocha"
  "Cutie Pro"
  "Everblush"
  "Everforest Dark Hard"
  "Ghostty Default Style Dark"
  "GitLab Dark Grey"
  "Hivacruz"
  "Hybrid"
  "Melange Dark"
  "Monokai Pro Machine"
  "Nightfox"
  "Oceanic Next"
  "Pnevma"
  "Red Planet"
  "Relaxed"
  "Rose Pine"
  "Ryuuko"
  "Solarized Dark Patched"
  "Spacegray"
  "Subliminal"
  "Terafox"
  "Tomorrow Night"
  "Zenbones Dark"
  "Zenwritten Dark"
)

# Pick a random theme
RANDOM_INDEX=$((RANDOM % ${#THEMES[@]}))
SELECTED_THEME="${THEMES[$RANDOM_INDEX]}"

# Write to theme-current
echo "theme = $SELECTED_THEME" > ~/.config/ghostty/theme-current

# Launch Ghostty
open -a Ghostty
