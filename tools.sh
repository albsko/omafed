#!/bin/bash

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Determine the directory of the script
RUNNING_SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
TOOLS_DIR="$RUNNING_SCRIPT_DIR/install/tools/"

# Find all .sh files in the TOOLS_DIR, sort them, and store them in an array using mapfile
mapfile -t sh_files < <(find "$TOOLS_DIR" -maxdepth 1 -type f -name "*.sh" | sort)
declare -A sh_map
for file in "${sh_files[@]}"; do
    sh_file_name=$(basename "$file" .sh)
    sh_map["$sh_file_name"]="$file"
done

mapfile -t required_sh_files < <(find "$TOOLS_DIR/required" -maxdepth 1 -type f -name "*.sh" | sort)
declare -A required_sh_map
for file in "${required_sh_files[@]}"; do
    required_sh_file_name=$(basename "$file" .sh)
    required_sh_map["$required_sh_file_name"]="$file"
done

# Sort the keys of the associative array and store them in an array using mapfile
mapfile -t sorted_regular_sh_keys < <(for key in "${!sh_map[@]}"; do echo "$key"; done | sort)

# Ask for tools to install
tools_to_install=$(gum choose "${sorted_regular_sh_keys[@]}" --no-limit --height 20 --header "What tools would you like to install?")

# Run scripts from required dir
if [[ -n "$tools_to_install" ]]; then
    for script in "${required_sh_map[@]}"; do
        echo "Running $script"
        bash "$script"
    done
fi

# Run selected installer scripts
for tool in $tools_to_install; do
    installer="${sh_map[$tool]}"
    echo "Running $installer"
    bash "$installer"
done

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300
