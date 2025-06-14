#!/bin/sh

pkg_preinst() {
    getent group uucp || groupadd -g 17 uucp
    getent group render || groupadd -g 323 render
}

case $1 in
    preinst) pkg_preinst ;;
esac