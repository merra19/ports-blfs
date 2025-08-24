#!/bin/sh

pkg_postinst() {
    rm -f /etc/ld.so.conf.d/tools.conf

    echo "rebuild pam elogind udev"
    echo "scratch -I -y -f -r pam elogind udev"
    exit 1
}

case $1 in
    postinst) pkg_postinst ;;
esac