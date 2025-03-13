#!/bin/sh

pkg_postinst() {
    if ( scratch isinstalled libtool ); then 
        scratch -I -y -f -r libtool
    fi
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac