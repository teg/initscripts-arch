VER:=$(shell sh -c 'git describe')

minilogd:
	minilogd.o

clean:
	rm -f minilogd minilogd.o

release:
	git archive HEAD --prefix=initscripts-$(VER)/ | xz > initscripts-$(VER).tar.xz
