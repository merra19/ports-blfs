#!/bin/sh


pkg_postinst() {
    rc-update add php-fpmphp default
}

pkg_preremove() {
    rc-update del php-fpmphp
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac