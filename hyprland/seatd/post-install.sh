#!/bin/sh

pkg_preinst() {
    getent group seat || groupadd -fg 202 seat 
}

pkg_postinst() {
    rc-update add seatd default 
}

pkg_preremove() {
    rc-update seatd dhcpcd
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac