#!/bin/sh


pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-php-fpm
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-php-fpm
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac