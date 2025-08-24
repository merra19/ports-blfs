#!/bin/sh

pkg_postupgrade() {
    echo "rebuild libtool after gcc"
    echo "scratch -I -y -f -r libtool"
    exit 1
}

case $1 in
    postupgrade) pkg_postupgrade ;;
esac