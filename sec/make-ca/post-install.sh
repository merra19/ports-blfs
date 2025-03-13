#!/bin/sh

pkg_postinst() {
    if [ -f /etc/ssl/certdata.txt ];then
        /usr/sbin/make-ca -r 
    else
        /usr/sbin/make-ca -g
    fi
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac