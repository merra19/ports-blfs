#!/bin/sh

pkg_postinst() {
    echo "rebuild libva-32 after mesa-32"
    echo "scratch -I -y -f -r libva-32"
    exit 1
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac