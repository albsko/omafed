#!/bin/bash
set -e

pkgs=(
	build-essential
	pkg-config
	autoconf
	bison
	clang
	libssl-dev
	libreadline-dev
	zlib1g-dev
	libyaml-dev
	libreadline-dev
	libncurses5-dev
	libffi-dev
	libgdbm-dev
	libjemalloc2
	libvips
	imagemagick
	libmagickwand-dev
	mupdf
	mupdf-tools
	redis-tools
	sqlite3
	libsqlite3-0
	libmysqlclient-dev
)

for pkg in "${pkgs[@]}"; do
	if ! dpkg -l | grep -q "$pkg"; then
		echo "Installing $pkg..."
		sudo apt install -y "$pkg"
	else
		echo "$pkg is already installed."
	fi
done
