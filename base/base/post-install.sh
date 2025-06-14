#!/bin/sh

pkg_postinst() {
    scratch install -f -r udev
    rc-update add consolefont boot
}

case $1 in
    postinst) pkg_postinst ;;
esac