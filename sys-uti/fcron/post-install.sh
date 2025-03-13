#!/bin/sh

pkg_preinst() {
    getent group fcron || groupadd -g 22 fcron
    getent passwd fcron || useradd -d /dev/null -c "Fcron User" -g fcron -s /bin/false -u 22 fcron
}

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-fcron
    
    fcrontab -z -u systab
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-fcron
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac