#!/bin/sh

pkg_postinst() {
    rc-update add udev default sysinit
    rc-update add udev-trigger sysinit
}

pkg_preremove() {
    rc-update del udev
    rc-update del udev-trigger
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac