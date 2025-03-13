#!/bin/sh

pkg_postinst() {
    udevadm hwdb --update
}

case $1 in
    postinst) pkg_postinst ;;
esac