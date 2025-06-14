#!/bin/sh

pkg_postinst() {
    rc-update add smartd default
}

pkg_preremove() {
    rc-update del smartd
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac