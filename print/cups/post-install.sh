#!/bin/sh

pkg_preinst() {
    getent group lpadmin || groupadd -g 19 lpadmin
    getent passwd lp || useradd -c "Print Service User" -d /var/spool/cups -g lp -s /bin/false -u 9 lp
}

pkg_postinst() {
    gtk-update-icon-cache -qtf /usr/share/icons/hicolor

    cd /usr/share/blfs-bootscripts
    make install-cups
}

pkg_postupgrade() {
    gtk-update-icon-cache -qtf /usr/share/icons/hicolor
    :
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-cups
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
    preremove) pkg_preremove ;;
esac