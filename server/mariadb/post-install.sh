#!/bin/sh

pkg_preinst() {
    getent group mariadb || groupadd -g 40 mariadb
    getent passwd mariadb || useradd -c "MariaDB Server" -d /srv/mariadb -g mariadb -s /bin/false -u 40 mariadb
}

pkg_preremove() {
    rc-update del mariadb 
}

case $1 in
    preinst) pkg_preinst ;;
    preremove) pkg_preremove ;;
esac