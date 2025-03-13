#!/bin/sh

pkg_postinst() {
    scratch install -f -r udev
}

case $1 in
    postinst) pkg_postinst ;;
esac