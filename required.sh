#!/bin/bash

# Update and upgrade the system
sudo apt update -y
sudo apt upgrade -y

# Install curl, git, and unzip if not already installed
for pkg in curl git unzip; do
    if ! dpkg -l | grep -qw $pkg; then
        echo "Installing $pkg..."
        sudo apt install -y $pkg
    fi
done

# Install flatpak and gnome-software-plugin-flatpak if not already installed
if ! dpkg -l | grep -qw flatpak; then
    echo "Installing flatpak..."
    sudo apt install -y flatpak
fi

if ! dpkg -l | grep -qw gnome-software-plugin-flatpak; then
    echo "Installing gnome-software-plugin-flatpak..."
    sudo apt install -y gnome-software-plugin-flatpak
fi

# Add flathub repository if not already added
if ! flatpak remotes | grep -qw flathub; then
    echo "Adding flathub repository..."
    sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi

# Install gum if not already installed
GUM_VERSION="0.14.1"
cd /tmp
if ! dpkg -l | grep -qw gum; then
    echo "Installing gum version $GUM_VERSION..."
    wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/latest/download/gum_${GUM_VERSION}_amd64.deb"
    sudo apt-get install -y ./gum.deb
    rm gum.deb
fi
cd -

