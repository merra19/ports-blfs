#!/bin/sh

pkg_postinst() {
    rm -f /etc/ld.so.conf.d/tools.conf

    echo "rebuild gnutls pam elogind udev"
    echo "to have gnutls with brotli , rebuild gnutls"
    echo "to have curl with c-ares , build c-ares andd rebuild curl"
    echo "scratch -I -y -f  c-ares && scratch -I -y -f -r curl gnutls pam elogind udev"
    exit 1
}

case $1 in
    postinst) pkg_postinst ;;
esac