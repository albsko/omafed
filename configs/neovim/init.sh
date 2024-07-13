#!/bin/bash

RUNNING_SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Only attempt to set configuration if Neovim has never been run
if [ ! -d "$HOME/.config/nvim" ]; then
	# Use LazyVim
	git clone https://github.com/LazyVim/starter ~/.config/nvim

	# Disable update notification popup in starter config
	sed -i 's/checker = { enabled = true }/checker = { enabled = true, notify = false }/g' ~/.config/nvim/lua/config/lazy.lua

	# Make everything match the terminal transparency
	mkdir -p ~/.config/nvim/plugin/after
	cp "$RUNNING_SCRIPT_DIR/transparency.lua" "$HOME/.config/nvim/plugin/after/"

	# Default to Catppuccin theme
	cp "$RUNNING_SCRIPT_DIR/../../themes/catppuccin/neovim.lua" "$HOME/.config/nvim/lua/plugins/theme.lua"

	# Enable default extras
	cp "$RUNNING_SCRIPT_DIR/lazyvim.json" "$HOME/.config/nvim/lazyvim.json"
fi
