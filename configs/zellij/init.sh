#!/bin/bash

RUNNING_SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

mkdir -p ~/.config/zellij/themes
[ ! -f "$HOME/.config/zellij/config.kdl" ] && cp "$RUNNING_SCRIPT_DIR/zellij.kdl" "$HOME/.config/zellij/config.kdl"
