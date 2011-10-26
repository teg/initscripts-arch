VER  := $(shell git describe)
DIRS := \
	/etc/rc.d \
	/etc/conf.d \
	/etc/rc.d/functions.d \
	/etc/logrotate.d \
	/etc/profile.d \
	/usr/sbin \
	/etc/tmpfiles.d \
	/usr/lib/tmpfiles.d \
	/etc/sysctl.d \
	/usr/lib/sysctl.d \
	/usr/lib/initscripts \
	/etc/bash_completion.d \
	/usr/share/zsh/site-functions \
	/usr/share/man/man8

all: doc

installdirs:
	install -dm755 $(foreach DIR, $(DIRS), $(DESTDIR)$(DIR))

install: installdirs doc
	install -m644 -t $(DESTDIR)/etc inittab rc.conf
	install -m755 -t $(DESTDIR)/etc rc.local rc.local.shutdown rc.multi rc.shutdown rc.single rc.sysinit
	install -m644 -t $(DESTDIR)/etc/logrotate.d bootlog
	install -m644 -t $(DESTDIR)/etc/rc.d functions
	install -m755 -t $(DESTDIR)/etc/rc.d hwclock network netfs
	install -m755 -t $(DESTDIR)/etc/profile.d locale.sh
	install -m755 -t $(DESTDIR)/usr/sbin rc.d
	install -m644 -t ${DESTDIR}/usr/share/man/man8 rc.d.8
	install -m755 -t $(DESTDIR)/usr/lib/initscripts arch-tmpfiles arch-sysctl
	install -m644 tmpfiles.conf $(DESTDIR)/usr/lib/tmpfiles.d/arch.conf
	install -m644 -T bash-completion $(DESTDIR)/etc/bash_completion.d/rc.d
	install -m644 -T zsh-completion $(DESTDIR)/usr/share/zsh/site-functions/_rc.d

rc.d.8: rc.d.8.txt
	a2x -d manpage -f manpage rc.d.8.txt

doc: rc.d.8

clean:
	rm -f rc.d.8

release:
	git archive HEAD --prefix=initscripts-$(VER)/ | xz > initscripts-$(VER).tar.xz
