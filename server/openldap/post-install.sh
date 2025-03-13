#!/bin/sh

pkg_preinst() {
    getent group ldap || groupadd -g 83 ldap
    getent passwd ldap || useradd  -c "OpenLDAP Daemon Owner" -d /var/lib/openldap -u 83 -g ldap -s /bin/false ldap
}


pkg_postinst() {
    su - postgres -c '/usr/bin/initdb -D /srv/pgsql/data'

    cd /usr/share/blfs-bootscripts
    make install-slapd
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-slapd
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac