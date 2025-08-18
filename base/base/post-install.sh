#!/bin/sh

pkg_postinst() {
    echo "rebuild elogind udev"
    echo "scratch -I -y -f -r elogind udev"
    exit 1
}

case $1 in
    postinst) pkg_postinst ;;
esac