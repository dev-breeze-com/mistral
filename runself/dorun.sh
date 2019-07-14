#!/bin/bash
AWD=/var/lib/runself/@pkgname@
cd /var/lib/runself/@pkgname@
echo "[1;33mCurrent folder `pwd` ...[0m"
export LD_LIBRARY_PATH="./:${AWD}/lib64:${AWD}/lib:/lib64:/usr/lib64:/lib:/usr/lib"
export LD_LIBRARY_PATH_64="./:${AWD}/lib64:${AWD}/lib:/lib64:/usr/lib64:/lib:/usr/lib"
LD_LIBRARY_PATH="./:${AWD}/lib64:${AWD}/lib:/lib64:/usr/lib64:/lib:/usr/lib" ${AWD}@pkgpath@ $@
#:irejail `pwd`/tmp/@pkgname@.run $@
#[ -e /etc/firejail/ ] && [ -e /usr/bin/firejail ] && firejail 
