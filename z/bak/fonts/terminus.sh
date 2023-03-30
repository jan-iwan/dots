#!/bin/bash

## WARNING: VERY POORLY WRITTEN SCRIPT ##

# compile and install terminus font
# with some patches
# only compile OTB and PCF
# no console support

# this downloads the tarball and extracts it automatically
# but it may be out of date idk
# you can go to https://terminus-font.sourceforge.net
# and do this manually
mkdir /tmp/terminus
cd /tmp/terminus
wget https://sourceforge.net/projects/terminus-font/files/terminus-font-4.49/terminus-font-4.49.1.tar.gz/download -O terminus.tar.gz
tar xpvf terminus.tar.gz
cd terminus-font-*

# this steps are described in the README
# this is just what i need

# install to ~/.local/share/fonts/
./configure --prefix=$HOME/.local

# patch for low tilde (~)
patch -p1 -i alt/td1.diff

# patch for thick braille
patch -p1 -i alt/br1.diff

# compile OTB and PCF
make -j8 otb pcf

# install PCF
make install-pcf

# install OTB
make install-otb

# clean files
cd /tmp
rm -r /tmp/terminus
