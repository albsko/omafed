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

echo "Fetching list of installed packages..."
installed_pkgs=$(dpkg -l | awk '{print $2}')

for pkg in "${pkgs[@]}"; do
	if echo "$installed_pkgs" | grep -q "${pkg}"; then
		echo "$pkg is already installed."
	else
		echo "Installing $pkg..."
		if sudo apt-get install -y "$pkg"; then
			echo "$pkg installed successfully."
		else
			echo "Failed to install $pkg." >&2
		fi
	fi
done
