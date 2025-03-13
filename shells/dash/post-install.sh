#!/bin/sh

pkg_postinst() {
    if ! grep -q "dash" /etc/shells; then
cat >> /etc/shells << "EOF"
/bin/dash
EOF
    fi
}

pkg_postremove() {
    sed -i '/dash/d' /etc/shells
}

case $1 in
    postinst) pkg_postinst ;;
    postremove) pkg_postremove ;;
esac