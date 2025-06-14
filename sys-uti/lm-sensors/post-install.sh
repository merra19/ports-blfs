#!/bin/sh

pkg_postinst() {
    rc-update add sensord default
}

pkg_preremove() {
    rc-update del sensord
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac