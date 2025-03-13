#!/bin/sh

pkg_preinst() {
    getent group postgres || groupadd -g 41 postgres
    getent passwd postgres || useradd -c "PostgreSQL Server" -g postgres -d /srv/pgsql/data -u 41 postgres
}

pkg_postinst() {
    su - postgres -c '/usr/bin/initdb -D /srv/pgsql/data'

    cd /usr/share/blfs-bootscripts
    make install-postgresql
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-postgresql
}


case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac