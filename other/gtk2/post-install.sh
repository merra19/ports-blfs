#!/bin/sh

pkg_postinst() {
    gtk-query-immodules-2.0 --update-cache
}

pkg_postupgrade() {
    pkg_postinst
}
case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac