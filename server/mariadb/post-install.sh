#!/bin/sh

pkg_preinst() {
    getent group mariadb || groupadd -g 40 mariadb
    getent passwd mariadb || useradd -c "MariaDB Server" -d /srv/mariadb -g mariadb -s /bin/false -u 40 mariadb
}

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
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac