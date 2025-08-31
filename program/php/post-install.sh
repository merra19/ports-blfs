#!/bin/sh


pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-php
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-php
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac