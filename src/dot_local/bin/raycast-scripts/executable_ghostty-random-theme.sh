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
  # Like default theme but better contrast for highlight color
  "Nightfox"
  # Nice aubergine
  "Belafonte Night"
  # Nice deep purple, brighter text contrast than belafonte night
  "Rose Pine"
  # Very pleasant dark
  "Everblush"
  # Nice generic dark
  "Zenwritten Dark"
  # A little brighter but nice
  "Melange Dark"
  # A bit brighter but nice
  "Subliminal"
  # Interesting green
  "Terafox"
)

# Pick a random theme
RANDOM_INDEX=$((RANDOM % ${#THEMES[@]}))
SELECTED_THEME="${THEMES[$RANDOM_INDEX]}"

# Write to theme-current
echo "theme = $SELECTED_THEME" > ~/.config/ghostty/theme-current

# Launch Ghostty
open -a Ghostty
