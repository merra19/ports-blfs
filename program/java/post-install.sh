#!/bin/sh

pkg_postinst() {
if ! grep -q "Java" /etc/man_db.conf; then

cat >> /etc/man_db.conf << "EOF"
# Begin Java addition
MANDATORY_MANPATH     /opt/jdk/man
MANPATH_MAP           /opt/jdk/bin     /opt/jdk/man
MANDB_MAP             /opt/jdk/man     /var/cache/man/jdk
# End Java addition
EOF

mandb -c /opt/jdk/man
fi
}

case $1 in
    postinst) pkg_postinst ;;
esac