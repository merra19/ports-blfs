#!/bin/sh

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-sshd
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-sshd
}

case $1 in
    #postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac