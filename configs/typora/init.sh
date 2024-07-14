#!/bin/bash

RUNNING_SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

mkdir -p ~/.config/Typora/themes
cp "$RUNNING_SCRIPT_DIR/ia_typora.css" "$HOME/.config/Typora/themes/"
cp "$RUNNING_SCRIPT_DIR/ia_typora_night.css" "$HOME/.config/Typora/themes/"
