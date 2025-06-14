#!/bin/sh

pkg_preinst() {
    [ ! -d /var/lib/dhcpcd ] && install  -v -m700 -d /var/lib/dhcpcd
    getent group dhcpcd || groupadd -g 52 dhcpcd
    getent passwd dhcpcd || useradd  -c 'dhcpcd PrivSep' -d /var/lib/dhcpcd  -g dhcpcd  -s /bin/false  -u 52 dhcpcd
    chown  -v dhcpcd:dhcpcd /var/lib/dhcpcd
}

pkg_postinst() {
    rc-update add dhcpcd default 
}

pkg_preremove() {
    rc-update del dhcpcd
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac