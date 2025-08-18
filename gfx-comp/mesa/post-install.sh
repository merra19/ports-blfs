#!/bin/sh

pkg_postinst() {
    echo "rebuild libva after mesa"
    echo "scratch -I -y -f -r libva"
    exit 1
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac