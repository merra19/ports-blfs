#!/bin/sh

pkg_postinst() {
    rc-update add rpcbind default
}

pkg_preremove() {
    rc-update del rpcbind
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac