#!/bin/sh
opkg update
pkgname="bash"
if [[ $(opkg list-installed | grep -c "^$pkgname") == "0" ]]; then echo -e "Installing [$pkgname]..." && opkg install $pkgname ; fi
pkgname="git"
if [[ $(opkg list-installed | grep -c "^$pkgname") == "0" ]]; then echo -e "Installing [$pkgname]..." && opkg install $pkgname ; fi
pkgname="git-http"
if [[ $(opkg list-installed | grep -c "^$pkgname") == "0" ]]; then echo -e "Installing [$pkgname]..." && opkg install $pkgname ; fi


NAMAPAKET="sms_adb"
LUCI=/usr/lib/lua/luci

[ -d /www/$NAMAPAKET ] && rm -rf /www/$NAMAPAKET
[ -e "$LUCI/view/$NAMAPAKET.htm" ] && rm -f "$LUCI/view/$NAMAPAKET.htm"
[ -e "$LUCI/controller/$NAMAPAKET.lua" ] && rm -f "$LUCI/controller/$NAMAPAKET.lua"

cd /www
git clone https://github.com/bolone-sengkuni/luci-sms-adb
cd luci-sms-adb/packages/luci-sms-adb
mv luasrc/controller/sms_adb.lua /usr/lib/lua/luci/controller/sms_adb.lua
mv luasrc/view/sms_adb.htm /usr/lib/lua/luci/view/sms_adb.htm
mv root/www/sms_adb /www/sms_adb

chmod +x /usr/lib/lua/luci/controller/sms_adb.lua
chmod +x /usr/lib/lua/luci/view/sms_adb.htm

[ -d /tmp/luci-modulecache ] && rm -rf /tmp/luci-modulecache
[ -e /tmp/luci-indexcache ] && rm -f /tmp/luci-indexcache
rm -rf /www/luci-sms-adb