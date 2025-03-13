#!/bin/sh

pkg_postinst() {
    install-catalog --add /etc/sgml/dsssl-docbook-stylesheets.cat \
        /usr/share/sgml/docbook/dsssl-stylesheets-1.79/catalog

    install-catalog --add /etc/sgml/dsssl-docbook-stylesheets.cat \
        /usr/share/sgml/docbook/dsssl-stylesheets-1.79/common/catalog

    install-catalog --add /etc/sgml/sgml-docbook.cat              \
        /etc/sgml/dsssl-docbook-stylesheets.cat
}

pkg_postupgrade() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac