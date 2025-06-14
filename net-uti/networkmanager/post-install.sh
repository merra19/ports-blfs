#!/bin/sh

pkg_postinst() {
    rc-update add networkmanager default
}

pkg_preremove() {
    rc-update del networkmanager
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac