#!/bin/sh

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-dbus

    dbus-uuidgen --ensure
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-dbus
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac