#!/bin/sh

export LC_ALL=C.UTF-8

skip_chrooted() {
  if [ "$(stat -c %d:%i /)" != "$(stat -c %d:%i /proc/1/root/.)" ]; then
    echo >&2 "  Skipped: Running in chroot."
    return 1
  fi
  return 0
}

udevd_live() {
  skip_chrooted

  if [ ! -S /run/udev/control ]; then
    echo >&2 "  Skipped: Device manager is not running."
    exit 0
  fi
}

for op in hwdb dbus_reload sysctl udev-reload  \
      ;do

    case "$op" in

    hwdb)
        /usr/bin/udev-hwdb --usr update
    ;;
    
    udev-reload)
        udevd_live && { 
            /usr/bin/udevadm control --reload
            /usr/bin/udevadm trigger -c change
            /usr/bin/udevadm settle
        }
    ;;

    sysctl)
        skip_chrooted && /usr/sbin/sysctl -q -p
    ;;

    dbus_reload)
        skip_chrooted && /etc/init.d/dbus restart
    ;;


    *)
        echo >&2 "  Invalid operation '$op'"
        exit 1
    ;;
    esac
done
