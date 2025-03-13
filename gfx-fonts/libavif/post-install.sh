#!/bin/sh

pkg_postinst() {
    gdk-pixbuf-query-loaders --update-cache
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac