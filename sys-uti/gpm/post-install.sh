#!/bin/sh

pkg_postinst() {
    rc-update add gpm default
}

pkg_preremove() {
    rc-update del gpm
}

case $1 in
    #postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac