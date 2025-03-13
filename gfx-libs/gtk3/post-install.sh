#!/bin/sh

pkg_postinst() {
    gtk-query-immodules-3.0 --update-cache
    glib-compile-schemas /usr/share/glib-2.0/schemas
}

pkg_postupgrade() {
    pkg_postinst
}
case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac