#!/bin/sh

pkg_postupgrade() {
    if scratch isinstalled  rpcbind;then
        scratch -I -y -f -r  rpcbind
    fi
}

case $1 in
    postupgrade) pkg_postupgrade ;;
esac