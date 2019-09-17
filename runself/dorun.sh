#!/bin/bash

AWD=/var/lib/runself/@pkgname@
cd /var/lib/runself/@pkgname@

echo "[1;33mCurrent folder `pwd` ...[0m"

LD_LIBRARY_PATH="./:${AWD}/lib64:${AWD}/usr/lib64:/lib64:/usr/lib64:/lib:/usr/lib" ${AWD}@pkgpath@ $@
