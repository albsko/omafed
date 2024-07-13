#!/bin/bash
set -e

pkgs=(
    fzf
    ripgrep
    bat
    zoxide
    plocate
    btop
    apache2-utils
    fd-find
)

echo "Fetching list of installed packages..."
installed_pkgs=$(dpkg -l | awk '{print $2}')

for pkg in "${pkgs[@]}"; do
    if echo "$installed_pkgs" | grep -q "${pkg}"; then
        echo "$pkg is already installed."
    else
        echo "Installing $pkg..."
        if sudo apt-get install -y "$pkg"; then
            echo "$pkg installed successfully."
        else
            echo "Failed to install $pkg." >&2
        fi
    fi
done

# Install eza
if ! echo "$installed_pkgs" | grep -q "${pkg}"; then
    echo "Installing eza..."
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -n -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt update
    sudo apt install -y eza
else
    echo "eza is already installed."
fi
