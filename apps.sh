#!/bin/bash

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Determine the directory of the script
SCRIPT_DIR=$(cd "$(dirname "$(readlink -f "$0" || echo "$0")")" && pwd)

# Run desktop installers
for installer in "$SCRIPT_DIR/apps/install"*.sh; do
    echo "Running $installer"
    bash "$installer"
done

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# gum confirm "Ready to logout for all settings to take effect?"
# gnome-session-quit --logout --no-prompt
