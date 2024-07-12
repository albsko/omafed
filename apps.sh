#!/bin/bash

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Determine the directory of the script
RUNNING_SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
APPS_DIR="$RUNNING_SCRIPT_DIR/apps/install/"

# Find all .sh files in the APPS_DIR, sort them, and store them in an array
sh_files=($(find "$APPS_DIR" -type f -name "*.sh" | sort))
declare -A sh_files_map

# Extract just the names of the scripts without the paths and store them in the associative array
for file in "${sh_files[@]}"; do
    sh_file_name=$(basename "$file" .sh)
    sh_files_map["$sh_file_name"]="$file"
done
sorted_files_map_keys=($(for key in "${!sh_files_map[@]}"; do echo "$key"; done | sort))

# Ask for apps to install
apps_to_install=$(gum choose "${sorted_files_map_keys[@]}" --no-limit --height 20 --header "What apps would you like to install?")

# Run selected installer scripts
for app in $apps_to_install; do
    installer="${sh_files_map[$app]}"
    echo "Running $installer"
    bash "$installer"
done

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# gum confirm "Ready to logout for all settings to take effect?"
# gnome-session-quit --logout --no-prompt
