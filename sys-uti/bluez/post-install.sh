#!/bin/sh

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-bluetooth
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-bluetooth
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac