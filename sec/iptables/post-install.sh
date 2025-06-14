#!/bin/sh

pkg_postinst() {
    rc-update add iptables-service default
}

pkg_preremove() {
    rc-update del iptables-service 
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac