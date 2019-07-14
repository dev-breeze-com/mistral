README
======

1. Introduction
2. Features
3. Configuration
4. Examples
5. Authors
6. Original Authors
7. Repository


INTRODUCTION
============

**mistral** is derived from *mkinitrd* from Slackware, and is used to build
an initial ramdisk or runself archive.

An initial ramdisk is a very small set of files that are loaded into RAM
and 'mounted' (as initramfs doesn't use a filesystem) as the kernel boots
(before the main root filesystem is mounted).

An initrd is used when kernel modules need to be loaded before mounting
the root partition. Usually these modules are required to support the root
filesystem (ext3, reiserfs, xfs), or perhaps the controller that the hard
drive is attached to (SCSI, RAID, etc). Essentially, there are so many
different options available in modern Linux kernels that it isn't practical
to try to ship many different kernels to try to cover everyone's needs.
It's a lot more flexible to ship a generic kernel and a set of kernel
modules for it.

A **runself** archive is a self-extracting shell archive with a built-in
executable script. The **runself** script is derived from the script
*Makeself* version 2.4.0. All **runself** archives are dependent on the
**mistral** infra-structure.

The command set of **mistral** is not compatible with the Slackware mkinitrd
command set. If run without options, **mistral** will build an initrd image,
based on your host machine's installation.


FEATURES
========

   - Support for overlay file tree (initrd/runself).
   - Support for SysV and OpenRC (initrd).
   - Support for RAID file systems (initrd).
   - Support for LVM file systems (initrd).
   - Support for LUKS encryption (initrd, WIP -- Work in Progress).
   - Support for Frame Buffer splash (initrd, todo).
   - Support for Mistral framebuffer splash (initrd, todo).
   - Support for Plymouth framebuffer splash (initrd, todo).


CONFIGURATION
=============

   INI-style configuration file at /etc/mistral/initrd.conf.  
   The configuration entries are self-explanatory.  


EXAMPLES
========

Build an initrd for a reiserfs root partition:  

  mistral -c -f reiserfs  

Build a runself archive for the package manager:  

  mistral.runself -c brzpkg  

Build an initrd image using Linux 2.6.33.1 kernel modules for a  
system with an ext3 root partition on /dev/sdb3:

  mistral -c -k 2.6.33.1 -f ext3 -r /dev/sdb3  

An example of a single encrypted partition setup:  

  mistral -c -k 2.6.33.1 -C -L -R -U -f ext4 -r /dev/mapper/luksroot


AUTHORS
=======

Pierre Innocent (dev@breezeos.com)  
The Breeze::OS website: http://www.breezeos.com  


ORIGINAL AUTHORS
================

Patrick J. Volkerding (volkerdi@slackware.com)


REPOSITORY
==========

   Mistral github.io: https://dev-breeze-com.github.io/mistral  
   Mistral v1.0.0: https://www.github.com/dev-breeze-com/mistral  

