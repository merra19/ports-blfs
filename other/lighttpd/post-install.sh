#!/bin/sh

pkg_preinst() {
    getent group lighttpd || groupadd -g 49 lighttpd
    getent passwd lighttpd || useradd -c "Lighttpd Server"  -g lighttpd -s /bin/false -u 49 lighttpd
}

pkg_postinst() {
	ln -sf  ../init.d/lighttpd /etc/rc.d/rc0.d/K28lighttpd
	ln -sf  ../init.d/lighttpd /etc/rc.d/rc1.d/K28lighttpd
	ln -sf  ../init.d/lighttpd /etc/rc.d/rc2.d/S32lighttpd
	ln -sf  ../init.d/lighttpd /etc/rc.d/rc3.d/S32lighttpd
	ln -sf  ../init.d/lighttpd /etc/rc.d/rc4.d/S32lighttpd
	ln -sf  ../init.d/lighttpd /etc/rc.d/rc5.d/S32lighttpd
	ln -sf  ../init.d/lighttpd /etc/rc.d/rc6.d/K28lighttpd
}

pkg_preremove() {
	rm -f /etc/rc.d/init.d/httpd
	rm -f /etc/rc.d/rc0.d/K28httpd
	rm -f /etc/rc.d/rc1.d/K28httpd
	rm -f /etc/rc.d/rc2.d/S32httpd
	rm -f /etc/rc.d/rc3.d/S32httpd
	rm -f /etc/rc.d/rc4.d/S32httpd
	rm -f /etc/rc.d/rc5.d/S32httpd
	rm -f /etc/rc.d/rc6.d/K28httpd
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac