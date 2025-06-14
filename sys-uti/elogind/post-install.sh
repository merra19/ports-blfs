#!/bin/sh

pkg_postinst() {
    rc-update add elogind boot
}

pkg_preremove() {
    rc-update del elogind
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac