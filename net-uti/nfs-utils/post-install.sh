#!/bin/sh

pkg_postinst() {
    rc-update add nfsclient default
}

pkg_preremove() {
    rc-update del nfsclient
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac