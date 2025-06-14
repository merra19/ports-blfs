#!/bin/sh

pkg_postinst() {
    rc-update add mdadm-raid boot
}

pkg_preremove() {
    rc-update del mdadm-raid
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac