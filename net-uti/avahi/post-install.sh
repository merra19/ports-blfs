#!/bin/sh

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-avahi
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-avahi
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac