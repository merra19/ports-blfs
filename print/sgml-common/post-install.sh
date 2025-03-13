#!/bin/sh

pkg_postinst() {
    install-catalog --add /etc/sgml/sgml-ent.cat \
        /usr/share/sgml/sgml-iso-entities-8879.1986/catalog >/dev/null

    install-catalog --add /etc/sgml/sgml-docbook.cat \
        /etc/sgml/sgml-ent.cat >/dev/null
}

pkg_preupgrade() {
    install-catalog --remove /etc/sgml/sgml-ent.cat \
        /usr/share/sgml/sgml-iso-entities-8879.1986/catalog &&

    install-catalog --remove /etc/sgml/sgml-docbook.cat \
        /etc/sgml/sgml-ent.cat
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    preupgrade) pkg_preupgrade ;;
    postupgrade) pkg_postupgrade ;;
esac