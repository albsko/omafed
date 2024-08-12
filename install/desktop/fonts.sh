#!/bin/bash

mkdir -p ~/.local/share/fonts

cd /tmp || return
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
unzip CascadiaMono.zip -d CascadiaFont
cp CascadiaFont/*.ttf ~/.local/share/fonts
rm -rf CascadiaMono.zip CascadiaFont

wget -O iafonts.zip https://github.com/iaolo/iA-Fonts/archive/refs/heads/master.zip
unzip iafonts.zip -d iaFonts
cp iaFonts/iA-Fonts-master/iA\ Writer\ Mono/Static/iAWriterMonoS-*.ttf ~/.local/share/fonts
rm -rf iafonts.zip iaFonts

INTER_ZIP_URL=$(curl -s https://api.github.com/repos/rsms/inter/releases/latest | grep "browser_download_url.*zip" | cut -d : -f 2,3 | tr -d \" | sed 's/^[ \t]*//')
wget "$INTER_ZIP_URL" -O Inter.zip

unzip Inter.zip -d InterFont
find InterFont -maxdepth 2 -type f -name "*.ttf" -exec cp {} ~/.local/share/fonts/ \;
find InterFont -maxdepth 2 -type f -name "*.ttc" -exec cp {} ~/.local/share/fonts/ \;

rm -rf Inter.zip InterFont

fc-cache
cd - || return
