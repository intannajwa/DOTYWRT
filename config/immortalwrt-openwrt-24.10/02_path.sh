#!/bin/bash

# Add the default password for the 'root' user（Change the empty password to 'password'）
# sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' package/base-files/files/etc/shadow

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='ImmortalWRT'" >>package/base-files/files/etc/openwrt_release

#!/bin/bash

mkdir -p feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include
curl -o feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js https://raw.githubusercontent.com/intannajwa/imo-path/main/24.10.0/10_system.js

#############################################
############## START EDIT HERE ##############
#############################################
export WRT_THEME="argon"          # DEFAULT THEME
export WRT_IP="192.168.1.1"       # DEFAULT IP
export WRT_MARK="DOTYWRT"     # DORE-V2.0
export WRT_DATE=$(date +%Y%m%d)   # DATE-FORMAT
export WRT_SSID="DOTYWRT"          # WIFI-NAME
export WRT_NAME="DOTYWRT"     # HOSTNAME
export FW_WRT_CC="DOTYWRT V1.0 - 2025"

sed -i "s/XXXXXXXXXX/$FW_WRT_CC/g" feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js
sed -i "s/luci-theme-bootstrap/luci-theme-$WRT_THEME/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")
sed -i "s/192\.168\.[0-9]*\.[0-9]*/$WRT_IP/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")

CFG_FILE="./package/base-files/files/bin/config_generate"
sed -i "s/192\.168\.[0-9]*\.[0-9]*/$WRT_IP/g" $CFG_FILE
sed -i "s/hostname='.*'/hostname='$WRT_NAME'/g" $CFG_FILE

echo "Customization script completed successfully!"
echo "You can now proceed with building your firmware."
