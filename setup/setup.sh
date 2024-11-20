#!/bin/bash

set -e
set -x

# Download
cd /tmp/setup
# renegadebbs.info wend down in July 2017.  Use the archive.org copy.
# Filename changed on renegadebbs.info.  archive.org copy no longer works because the renegadebbs.info owner added a robots.txt to prevent it.
# wget http://renegadebbs.info/files/2014%20unofficial.rgbbsfullv120a.zip
wget 'https://renegadebbs.info/files/2014%20unofficial.rgbbsfullv120a.zip' -O unofficial.rgbbsfullv120a.zip

sha256sum -c < sums

cd /dos/drive_g
unzip /tmp/setup/unofficial.rgbbsfullv120a.zip
rm /tmp/setup/unofficial.rgbbsfullv120a.zip
cd rg/DATA

# set up all 9 nodes.
for ASDF in 2 3 4 5 6 7 8 9; do
  cp NODE1.DAT NODE$ASDF.DAT
done
mv /tmp/setup/MULTNODE.DAT .

cd /dos/drive_g/rg

# Patch the paths
find . -type f -exec sed -i 's,C:\\RG,G:\\RG,g' {} \;

cd /dos

echo 2 > /dos/numnodes   # 2 nodes by default


