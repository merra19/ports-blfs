#!/bin/sh

pkg_postinst() {

    if [ ! -f /etc/localtime ] ;then
        ln -sfv /usr/share/zoneinfo/Europe/Paris /etc/localtime
    fi
}

case $1 in
    postinst) pkg_postinst ;;
esac