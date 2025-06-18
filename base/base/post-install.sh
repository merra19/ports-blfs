#!/bin/sh

pkg_postinst() {
    if [ "$NO_REBUILD" = 0 ] || [ "$NO_REBUILD" = "no" ]; then
        scratch install -f -r udev
    fi
}

case $1 in
    postinst) pkg_postinst ;;
esac