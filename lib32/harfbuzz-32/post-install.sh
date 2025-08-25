#!/bin/sh

pkg_postinst() {
    echo "rebuild freetype-32 cairo-32 graphite2-32 harfbuzz-32 "
    echo "scratch -I -y -f -r freetype-32 cairo-32 graphite2-32 harfbuzz-32"
    exit 1
}

case $1 in
    postinst) pkg_postinst ;;
esac