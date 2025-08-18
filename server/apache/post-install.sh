#!/bin/sh

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-httpd
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-httpd
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac