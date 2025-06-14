#!/bin/sh

pkg_preinst() {
    getent group apache || groupadd -g 25 apache
    getent passwd apache || useradd -c "Apache Server" -d /srv/www -g apache -s /bin/false -u 25 apache
}

pkg_preremove() {
    rc-update del apache2 
}

case $1 in
    preinst) pkg_preinst ;;
    preremove) pkg_preremove ;;
esac