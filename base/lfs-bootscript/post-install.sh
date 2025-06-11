#!/bin/sh

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-random
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make install-random
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac