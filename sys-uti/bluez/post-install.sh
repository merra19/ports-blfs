#!/bin/sh

pkg_postinst() {
    rc-update add bluetooth default
}

pkg_preremove() {
    rc-update del bluetooth
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac