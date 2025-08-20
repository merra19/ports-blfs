#!/bin/sh

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    #make install-slapd

    if [ ! -f /usr/lib/krb5/plugins/kdb/kldap.so ];then
        echo "rebuild krb5"
        echo "scratch -I -y -f -r krb5"
        exit 1
    fi
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-slapd
}

case $1 in
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac