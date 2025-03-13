#!/bin/sh

pkg_postinst() {
    update-mime-database /usr/share/mime
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac