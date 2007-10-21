#!/bin/sh

install -d -m755 ${DESTDIR}/etc/{rc.d,conf.d}

for i in inittab rc.conf; do
  install -D -m644 $i ${DESTDIR}/etc/$i
done
for i in rc.local rc.local.shutdown rc.multi rc.shutdown rc.single rc.sysinit; do
  install -D -m755 $i ${DESTDIR}/etc/$i
done

install -D -m644 functions ${DESTDIR}/etc/rc.d/functions
for i in network netfs; do
  install -D -m755 $i ${DESTDIR}/etc/rc.d/$i
done

gcc $CFLAGS -o minilogd minilogd.c || return 1
install -D -m755 minilogd ${DESTDIR}/sbin/minilogd

install -D -m755 netcfg ${DESTDIR}/usr/bin/netcfg
install -D -m644 profile-template ${DESTDIR}/etc/network-profiles/template

install -D -m755 makedevs ${DESTDIR}/sbin/makedevs
