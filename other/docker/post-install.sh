#!/bin/sh

pkg_preinst() {
    getent group docker || groupadd --system docker
}

case $1 in
    preinst) pkg_preinst ;;
esac