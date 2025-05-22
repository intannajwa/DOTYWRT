#!/bin/bash

sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='ImmortalWRT'" >>package/base-files/files/etc/openwrt_release
