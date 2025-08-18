#!/bin/sh

pkg_postinst() {
    echo "rebuild libtool after gcc"
    echo "scratch -I -y -f -r libtool"
    exit 1
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac