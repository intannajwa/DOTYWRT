#!/bin/bash

# Add the default password for the 'root' user（Change the empty password to 'password'）
# sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' package/base-files/files/etc/shadow

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='ImmortalWRT'" >>package/base-files/files/etc/openwrt_release

mkdir -p feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include
curl -o feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js https://raw.githubusercontent.com/aNzTikTok/act/main/path/10_system.js

## PATH

export FW_WRT_CC="DOTYWRT V1.1 BY Dotycat.com"
sed -i "s/XXXXXXXXXX/$FW_WRT_CC/g" feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js

cd include/
rm version.mk
wget https://raw.githubusercontent.com/iFHax/act/main/path/version.mk


echo "Customization script completed successfully!"
echo "You can now proceed with building your firmware."
