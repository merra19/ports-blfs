#!/bin/sh

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-nfs-client
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-nfs-client
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac