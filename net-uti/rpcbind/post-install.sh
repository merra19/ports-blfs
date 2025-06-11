#!/bin/sh

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-rpcbind
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-rpcbind
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac