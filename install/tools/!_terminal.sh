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

for pkg in "${pkgs[@]}"; do
    if ! dpkg -l | grep -q "$pkg"; then
        echo "Installing $pkg..."
        sudo apt install -y "$pkg"
    else
        echo "$pkg is already installed."
    fi
done

if ! dpkg -l | grep -q "eza"; then
    echo "Installing eza..."
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o -n /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt update
    sudo apt install -y eza
else
    echo "eza is already installed."
fi
