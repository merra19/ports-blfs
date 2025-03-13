#!/bin/sh

pkg_postinst() {
    ldconfig
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postinst ;;
esac