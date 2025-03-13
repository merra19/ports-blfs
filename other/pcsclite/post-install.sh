#!/bin/sh

pkg_preinst() {
    getent group pcscd || groupadd -g 102 pcscd
    getent passwd pcscd || useradd -c "PC/SC Architecture"  -g pcscd -s /bin/false -u 102 pcscd
}

pkg_postinst() {
    :
}

pkg_preremove() {
    :
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac