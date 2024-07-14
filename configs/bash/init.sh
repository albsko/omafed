#!/bin/bash

RUNNING_SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Configure the bash shell using Omakub defaults
[ -f "$HOME/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp "$RUNNING_SCRIPT_DIR/bashrc" "$HOME/.bashrc"

# Load the PATH for use later in the installers
# shellcheck source=/dev/null
source ~/.local/share/omapop/defaults/bash/shell

[ -f "$HOME/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using Omakub defaults
cp ~/.local/share/omapop/configs/bash/inputrc ~/.inputrc
