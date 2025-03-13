#!/bin/sh

pkg_preinst() {
    getent group apache || groupadd -g 25 apache
    getent passwd apache || useradd -c "Apache Server" -d /srv/www -g apache -s /bin/false -u 25 apache
}

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-httpd
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-httpd
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac