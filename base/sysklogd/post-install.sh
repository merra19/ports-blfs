#!/bin/sh

pkg_postinst() {
    rc-update add sysklogd default
}

pkg_preremove() {
    rc-update del sysklogd
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac