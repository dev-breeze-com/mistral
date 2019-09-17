#!/bin/bash

AWD=/var/lib/runself/@pkgname@
cd /var/lib/runself/@pkgname@

echo "[1;33mCurrent folder `pwd` ...[0m"

if [ -e ./etc/firejail/@pkgname@.profile -a -e ./usr/bin/firejail ]; then
   LD_LIBRARY_PATH="./:${AWD}/lib64:${AWD}/usr/lib64:/lib64:/usr/lib64:/lib:/usr/lib" ./usr/bin/firejail @pkgpath@ $@
else
	LD_LIBRARY_PATH="./:${AWD}/lib64:${AWD}/usr/lib64:/lib64:/usr/lib64:/lib:/usr/lib" ${AWD}@pkgpath@ $@
fi
