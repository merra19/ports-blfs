#!/bin/sh

pkg_postinst() {
    if [ "$NO_REBUILD" = 0 ] || [ "$NO_REBUILD" = "no" ]; then
        scratch -I -y -f -r libva
    fi
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac