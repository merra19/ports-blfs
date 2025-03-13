#!/bin/sh

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-power-profiles-daemon
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-power-profiles-daemon
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac