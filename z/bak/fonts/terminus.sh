#!/bin/bash

## WARNING: VERY POORLY WRITTEN SCRIPT ##

# Compile and install terminus font with some patches.
# Only compile OTB and PCF.
# No console support.

# This downloads the tarball and extracts it automatically but it may be out of
# date idk you can go to https://terminus-font.sourceforge.net and do this
# manually.
mkdir /tmp/terminus
cd /tmp/terminus
wget https://sourceforge.net/projects/terminus-font/files/terminus-font-4.49/terminus-font-4.49.1.tar.gz/download -O terminus.tar.gz
tar xpvf terminus.tar.gz
cd terminus-font-*

# This steps are described in the README, this is just what i need.

# Install to ~/.local/share/fonts/
./configure --prefix=$HOME/.local

# Patch for low tilde (~)
patch -p1 -i alt/td1.diff

# Patch for thick braille
patch -p1 -i alt/br1.diff

# Compile OTB and PCF
make -j8 otb pcf

# Install PCF
make install-pcf

# Install OTB
make install-otb

# Clean files
cd /tmp
rm -r /tmp/terminus
