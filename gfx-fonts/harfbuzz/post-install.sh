#!/bin/sh

pkg_postinst() {
    echo "rebuild freetype cairo graphite2 harfbuzz "
    echo "scratch -I -y -f -r freetype cairo graphite2 harfbuzz"
    exit 1
}

pkg_postupgrade() {
    #pkg_postinst
    :
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac