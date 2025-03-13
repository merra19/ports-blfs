#!/bin/sh

pkg_postinst() {
    fc-cache -v /usr/share/ghostscript/fonts/
}

pkg_postupgrade() {
    pkg_postinst
}

pkg_postremove() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
    postremove) pkg_postremove ;;
esac