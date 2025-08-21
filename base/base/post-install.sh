#!/bin/sh

pkg_postinst() {
    rm -f /etc/ld.so.conf.d/tools.conf

    echo "rebuild elogind udev"
    echo "scratch -I -y -f -r elogind udev"
    exit 1
}

case $1 in
    postinst) pkg_postinst ;;
esac