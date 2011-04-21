#!/bin/sh

set -e

install -d -m755 ${DESTDIR}/etc/rc.d
install -d -m755 ${DESTDIR}/etc/conf.d
install -d -m755 ${DESTDIR}/etc/rc.d/functions.d/
install -d -m755 ${DESTDIR}/etc/cron.hourly/

for i in inittab rc.conf; do
  install -D -m644 $i ${DESTDIR}/etc/$i
done
for i in rc.local rc.local.shutdown rc.multi rc.shutdown rc.single rc.sysinit; do
  install -D -m755 $i ${DESTDIR}/etc/$i
done

install -D -m755 adjtime.cron ${DESTDIR}/etc/cron.hourly/adjtime

install -D -m644 functions ${DESTDIR}/etc/rc.d/functions
for i in hwclock network netfs; do
  install -D -m755 $i ${DESTDIR}/etc/rc.d/$i
done

make minilogd
install -D -m755 minilogd ${DESTDIR}/sbin/minilogd

install -D -m755 rc ${DESTDIR}/sbin/rc
