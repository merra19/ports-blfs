#!/bin/sh

pkg_preinst() {
    getent group ldap || groupadd -g 83 ldap
    getent passwd ldap || useradd  -c "OpenLDAP Daemon Owner" -d /var/lib/openldap -u 83 -g ldap -s /bin/false ldap
}


pkg_postinst() {
    if [ ! -f /usr/lib/krb5/plugins/kdb/kldap.so ];then
        scratch install -y -f -r krb5
    fi
}

pkg_preremove() {
    rc-update del slapd 
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac