#!/bin/bash

# Check if a color argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <color>"
  echo "Color can be a hex code (#ddd), or RGB value (rgb(255, 255, 255))."
  exit 1
fi

COLOR=$1

gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background picture-uri-dark ''
gsettings set org.gnome.desktop.background primary-color "$COLOR"

echo "Wallpaper color set to $COLOR"
