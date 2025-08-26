SHELL=/bin/bash

ETCDIR=/etc
LIBDIR=${DESTDIR}/lib/services
EXTDIR=${DESTDIR}${ETCDIR}
MODE=754
DIRMODE=755
CONFMODE=644

all:
	@grep "^install" Makefile | cut -d ":" -f 1
	@echo "Select an appropriate install target from the above list"

create-dirs:
	install -d -m ${DIRMODE} ${EXTDIR}/rc.d/rc{0,1,2,3,4,5,6,S}.d
	install -d -m ${DIRMODE} ${EXTDIR}/rc.d/init.d
	install -d -m ${DIRMODE} ${EXTDIR}/sysconfig

install-seatd: create-dirs
	ln -sf  ../init.d/seatd ${EXTDIR}/rc.d/rc0.d/K30seatd
	ln -sf  ../init.d/seatd ${EXTDIR}/rc.d/rc1.d/K30seatd
	ln -sf  ../init.d/seatd ${EXTDIR}/rc.d/rc2.d/S70seatd
	ln -sf  ../init.d/seatd ${EXTDIR}/rc.d/rc3.d/S70seatd
	ln -sf  ../init.d/seatd ${EXTDIR}/rc.d/rc4.d/S70seatd
	ln -sf  ../init.d/seatd ${EXTDIR}/rc.d/rc5.d/S70seatd
	ln -sf  ../init.d/seatd ${EXTDIR}/rc.d/rc6.d/K30seatd

install-docker: create-dirs
	ln -sf  ../init.d/docker ${EXTDIR}/rc.d/rc0.d/K30docker
	ln -sf  ../init.d/docker ${EXTDIR}/rc.d/rc1.d/K30docker
	ln -sf  ../init.d/docker ${EXTDIR}/rc.d/rc2.d/S70docker
	ln -sf  ../init.d/docker ${EXTDIR}/rc.d/rc3.d/S70docker
	ln -sf  ../init.d/docker ${EXTDIR}/rc.d/rc4.d/S70docker
	ln -sf  ../init.d/docker ${EXTDIR}/rc.d/rc5.d/S70docker
	ln -sf  ../init.d/docker ${EXTDIR}/rc.d/rc6.d/K30docker

install-lighttpd: create-dirs
	ln -sf  ../init.d/lighttpd ${EXTDIR}/rc.d/rc0.d/K30lighttpd
	ln -sf  ../init.d/lighttpd ${EXTDIR}/rc.d/rc1.d/K30lighttpd
	ln -sf  ../init.d/lighttpd ${EXTDIR}/rc.d/rc2.d/S70lighttpd
	ln -sf  ../init.d/lighttpd ${EXTDIR}/rc.d/rc3.d/S70lighttpd
	ln -sf  ../init.d/lighttpd ${EXTDIR}/rc.d/rc4.d/S70lighttpd
	ln -sf  ../init.d/lighttpd ${EXTDIR}/rc.d/rc5.d/S70lighttpd
	ln -sf  ../init.d/lighttpd ${EXTDIR}/rc.d/rc6.d/K30lighttpd

install-pcsclite: create-dirs
	ln -sf  ../init.d/pcsclite ${EXTDIR}/rc.d/rc0.d/K30pcsclite
	ln -sf  ../init.d/pcsclite ${EXTDIR}/rc.d/rc1.d/K30pcsclite
	ln -sf  ../init.d/pcsclite ${EXTDIR}/rc.d/rc2.d/S70pcsclite
	ln -sf  ../init.d/pcsclite ${EXTDIR}/rc.d/rc3.d/S70pcsclite
	ln -sf  ../init.d/pcsclite ${EXTDIR}/rc.d/rc4.d/S70pcsclite
	ln -sf  ../init.d/pcsclite ${EXTDIR}/rc.d/rc5.d/S70pcsclite
	ln -sf  ../init.d/pcsclite ${EXTDIR}/rc.d/rc6.d/K30pcsclite

uninstall-seatd:
	rm -f ${EXTDIR}/rc.d/init.d/seatd
	rm -f ${EXTDIR}/rc.d/rc0.d/K30seatd
	rm -f ${EXTDIR}/rc.d/rc1.d/K30seatd
	rm -f ${EXTDIR}/rc.d/rc2.d/S70seatd
	rm -f ${EXTDIR}/rc.d/rc3.d/S70seatd
	rm -f ${EXTDIR}/rc.d/rc4.d/S70seatd
	rm -f ${EXTDIR}/rc.d/rc5.d/S70seatd
	rm -f ${EXTDIR}/rc.d/rc6.d/K30seatd

uninstall-docker:
	rm -f ${EXTDIR}/rc.d/init.d/docker
	rm -f ${EXTDIR}/rc.d/rc0.d/K30docker
	rm -f ${EXTDIR}/rc.d/rc1.d/K30docker
	rm -f ${EXTDIR}/rc.d/rc2.d/S70docker
	rm -f ${EXTDIR}/rc.d/rc3.d/S70docker
	rm -f ${EXTDIR}/rc.d/rc4.d/S70docker
	rm -f ${EXTDIR}/rc.d/rc5.d/S70docker
	rm -f ${EXTDIR}/rc.d/rc6.d/K30docker

uninstall-pcsclite:
	rm -f ${EXTDIR}/rc.d/init.d/pcsclite
	rm -f ${EXTDIR}/rc.d/rc0.d/K30pcsclite
	rm -f ${EXTDIR}/rc.d/rc1.d/K30pcsclite
	rm -f ${EXTDIR}/rc.d/rc2.d/S70pcsclite
	rm -f ${EXTDIR}/rc.d/rc3.d/S70pcsclite
	rm -f ${EXTDIR}/rc.d/rc4.d/S70pcsclite
	rm -f ${EXTDIR}/rc.d/rc5.d/S70pcsclite
	rm -f ${EXTDIR}/rc.d/rc6.d/K30pcsclite

uninstall-lighttpd:
	rm -f ${EXTDIR}/rc.d/init.d/lighttpd
	rm -f ${EXTDIR}/rc.d/rc0.d/K30lighttpd
	rm -f ${EXTDIR}/rc.d/rc1.d/K30lighttpd
	rm -f ${EXTDIR}/rc.d/rc2.d/S70lighttpd
	rm -f ${EXTDIR}/rc.d/rc3.d/S70lighttpd
	rm -f ${EXTDIR}/rc.d/rc4.d/S70lighttpd
	rm -f ${EXTDIR}/rc.d/rc5.d/S70lighttpd
	rm -f ${EXTDIR}/rc.d/rc6.d/K30lighttpd