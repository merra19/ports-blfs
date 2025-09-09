#!/bin/sh

pkg_postinst() {
    rm -f /etc/ld.so.conf.d/tools.conf

    echo "cmake is built with curl bundled ,if you want to use system curl rebuild cmake"
    echo "scratch -I -y -f -r cmake"
    exit 1
}

case $1 in
    postinst) pkg_postinst ;;
esac