#!/bin/sh

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-service-bridge
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-service-bridge
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac