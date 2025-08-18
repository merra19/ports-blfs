#!/bin/sh

pkg_postinst() {
    if [ ! -d /srv/mariadb ]; then
        mariadb-install-db --basedir=/usr --datadir=/srv/mariadb --user=mariadb
        chown -R mariadb:mariadb /srv/mariadb
    fi

    cd /usr/share/blfs-bootscripts
    make install-mariadb
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-mariadb
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac