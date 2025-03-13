#!/bin/sh

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-iptables
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-iptables
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac