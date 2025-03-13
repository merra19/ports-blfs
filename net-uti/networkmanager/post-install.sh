#!/bin/sh

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-networkmanager
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-networkmanager
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac