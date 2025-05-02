#!/bin/bash

# Clone the ImmortalWRT repository and switch to the specified branch
git clone --branch openwrt-24.10 https://github.com/immortalwrt/immortalwrt.git && cd immortalwrt

# Update and install all feeds (package definitions)
./scripts/feeds update -a && ./scripts/feeds install -a

# Create necessary directory and download a custom system status JavaScript file
mkdir -p feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include
curl -o feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js \
  https://raw.githubusercontent.com/intannajwa/imo-path/main/24.10.0/10_system.js

# Replace placeholder with custom version label
sed -i "s/XXXXXXXXXX/DOTYWRT V1.0 - 2025/g" \
  feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js

wget https://raw.githubusercontent.com/iFHax/act/main/config/immortalwrt-openwrt-24.10/.config

mkdir files
cd files 
git clobe
# make menuconfig

make defconfig

# Download all required packages
make download -j8

# Start the build with verbose output and use all available CPU cores
make V=s -j$(nproc)
 

