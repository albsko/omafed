#!/bin/bash

# Remove some applications entries
sudo rm -rf /usr/share/applications/btop.desktop
sudo rm -rf /usr/share/applications/display-im6.q16.desktop
sudo rm -rf /usr/local/share/applications/nvim.desktop
sudo rm -rf /usr/local/share/applications/vim.desktop

# Disable io.elementary.appcenter
sudo mv -v /etc/xdg/autostart/io.elementary.appcenter-daemon.desktop /etc/xdg/autostart/io.elementary.appcenter-daemon.desktop.bak

# Set favorite apps
gsettings set org.gnome.shell favorite-apps "[]"
