#!/bin/sh

pkg_postinst() {
    gtk-update-icon-cache -qtf /usr/share/icons/hicolor &&
    update-desktop-database -q
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac