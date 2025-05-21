#!/bin/bash

sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='ImmortalWRT'" >>package/base-files/files/etc/openwrt_release

mkdir -p feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include
curl -o feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js https://raw.githubusercontent.com/aNzTikTok/act/main/path/10_system.js

## PATH

export FW_WRT_CC="DOTYWRT V1.2 BY Dotycat.com"
sed -i "s/XXXXXXXXXX/$FW_WRT_CC/g" feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js

echo "Customization script completed successfully!"
echo "You can now proceed with building your firmware."
