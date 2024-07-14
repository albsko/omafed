#!/bin/bash

RUNNING_SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

mkdir -p ~/.config/alacritty
cp "$RUNNING_SCRIPT_DIR/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
cp "$RUNNING_SCRIPT_DIR/theme.toml" "$HOME/.config/alacritty/theme.toml"
cp "$RUNNING_SCRIPT_DIR/font.toml" "$HOME/.config/alacritty/font.toml"
cp "$RUNNING_SCRIPT_DIR/font-size.toml" "$HOME/.config/alacritty/font-size.toml"
cp "$RUNNING_SCRIPT_DIR/omapop.toml" "$HOME/.config/alacritty/omapop.toml"
