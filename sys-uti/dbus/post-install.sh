#!/bin/sh

pkg_postinst() {
    dbus-uuidgen --ensure
    rc-update add dbus default
}

pkg_preremove() {
    rc-update del dbus
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac