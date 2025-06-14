#!/bin/sh

pkg_preinst() {
    getent group postgres || groupadd -g 41 postgres
    getent passwd postgres || useradd -c "PostgreSQL Server" -g postgres -d /srv/pgsql/data -u 41 postgres
}

case $1 in
    preinst) pkg_preinst ;;
esac