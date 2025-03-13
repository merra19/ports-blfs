#!/bin/sh

pkg_postinst() {

    install-catalog --add /etc/sgml/openjade-1.3.2.cat  \
        /usr/share/sgml/openjade-1.3.2/catalog &&

    install-catalog --add /etc/sgml/sgml-docbook.cat    \
        /etc/sgml/openjade-1.3.2.cat

    if ! grep -q 'SYSTEM "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd' /usr/share/sgml/openjade-1.3.2/catalog; then
    echo "SYSTEM \"http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd\" \
        \"/usr/share/xml/docbook/xml-dtd-4.5/docbookx.dtd\"" >> \
        /usr/share/sgml/openjade-1.3.2/catalog
    fi
}

case $1 in
    postinst) pkg_postinst ;;
esac