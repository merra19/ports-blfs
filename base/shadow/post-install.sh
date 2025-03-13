#!/bin/sh

pkg_postinst() {
    pwconv
    grpconv
    mkdir -p /etc/default
    useradd -D --gid 999
}

case $1 in
    postinst) pkg_postinst ;;
esac