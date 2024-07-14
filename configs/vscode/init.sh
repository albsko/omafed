#!/bin/bash

RUNNING_SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

mkdir -p ~/.config/Code/User
cp "$RUNNING_SCRIPT_DIR/vscode.json" "$HOME/.config/Code/User/settings.json"
