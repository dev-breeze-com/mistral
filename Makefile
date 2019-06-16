##############################################################
#                    Make Wrapper Makefile                   #
############################################################## 

ARCH ?= x86_64
PREFIX := /usr
SHELL := /bin/bash

install: archive
	@ tar --xz -cvf mistral-0.9.0.txz /etc/mistral $(PREFIX)/share/mistral/ $(PREFIX)/share/doc/mistral/ $(PREFIX)/sbin/mistral $(PREFIX)/share/man/man8/mistral.8.gz

archive:
	@ (mkdir -p /etc/mistral)
	@ (chmod a+rx /etc/mistral)
	@ (cp -av initrd.conf /etc/mistral/)
	@ (cp -f mkinitrd $(PREFIX)/sbin/mistral)
	@ (cp -av docs/man/man8 $(PREFIX)/share/man/)
	@ (cp -av docs/mistral $(PREFIX)/share/doc/)
	@ (mkdir -p $(PREFIX)/share/mistral)
	@ (chmod a+rx $(PREFIX)/share/mistral)
	@ (cp -rf data/bin $(PREFIX)/share/mistral/)
	@ (cp -av data/keymaps.tar.gz $(PREFIX)/share/mistral/)
	@ (cp -av data/busybox-1.31.0.tar.xz $(PREFIX)/share/mistral/)
	@ (cp -av data/fbsplash $(PREFIX)/share/mistral/)
	@ (cp -av data/initrd-tree-$(ARCH).tgz $(PREFIX)/share/mistral/initrd-tree.tar.gz)

busybox:
	@ (mkdir -p ./build)
	@ (tar -C build -xvf data/busybox-1.31.0.tar.xz)
	@ (cd ./build/busybox-1.31.0 && make menuconfig)
	@ (cd ./build/busybox-1.31.0 && ls -lt .config && make)
	@ (mkdir data/bin)
	@ (cp -f build/busybox-1.31.0/busybox data/bin/)

