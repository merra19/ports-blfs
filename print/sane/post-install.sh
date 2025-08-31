#!/bin/sh

pkg_preinst() {
    getent group scanner || groupadd -g 70 scanner
}

case $1 in
    preinst) pkg_preinst ;;
esac