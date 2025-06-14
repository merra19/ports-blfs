#!/bin/sh

pkg_preinst() {
    getent group fcron || groupadd -g 22 fcron
    getent passwd fcron || useradd -d /dev/null -c "Fcron User" -g fcron -s /bin/false -u 22 fcron
}

pkg_postinst() {
    fcrontab -z -u systab
    rc-update add fcron default
}

pkg_preremove() {
    rc-update del fcron
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac