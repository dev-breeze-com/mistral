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

**mistral** is used to build an initial ramdisk. An initial ramdisk is
a very small set of files that are loaded into RAM and 'mounted' (as
initramfs doesn't actually use a filesystem) as the kernel boots (before
the main root filesystem is mounted).  The usual reason to use an initrd
is because you need to load kernel modules before mounting the root partition.
Usually these modules are required to support the filesystem used by the
root partition (ext3, reiserfs, xfs), or perhaps the controller that the
hard drive is attached to (SCSI, RAID, etc).  Essentially, there are so many
different options available in modern Linux kernels that it isn't practical
to try to ship many different kernels to try to cover everyone's needs.
It's a lot more flexible to ship a generic kernel and a set of kernel
modules for it. Mistral's command set is not compatible with the Slackware
mkinitrd command set.


FEATURES
========

   - INI-style configuration.
   - Support for overlay file tree.
   - Support for SysV and OpenRC.
   - Support for RAID file systems.
   - Support for LVM file systems.
   - Support for LUKS encryption.
   - Support for Frame Buffer splash.
   - Support for Plymouth framebuffer splash.


CONFIGURATION
=============

   INI-style configuration file at /etc/mistral/initrd.conf.  
   The configuration entries are self-explanatory.  


EXAMPLES
========

A simple example:  Build an initrd for a reiserfs root partition:  

  mistral -c -F reiserfs  

Another example:  Build an initrd image using Linux 2.6.33.1 kernel
modules for a system with an ext3 root partition on /dev/sdb3:

  mistral -c -k 2.6.33.1 -F ext3 -f ext3 -r /dev/sdb3  

An example of a single encrypted partition setup:  

  mistral -c -k 2.6.33.1 -L -R -C -u \  
	 -f ext4 -r /dev/mapper/luksroot \  
	 -M 'ext4 ehci-hcd uhci-hcd usbhid'

If run without options, mistral will rebuild an initrd image using
the contents of the $RD_LAYOUT folder; or, if that directory does not
exist, it will be created and populated, and then mistral will exit.


AUTHORS
=======

Pierre Innocent &lt;<A HREF="mailto:dev@breezeos.com">dev@breezeos.com</A>&gt;  
The Breeze::OS website: http://www.breezeos.com  


ORIGINAL AUTHORS
================

Patrick J. Volkerding &lt;<A HREF="mailto:volkerdi@slackware.com">volkerdi@slackware.com</A>&gt;  


REPOSITORY
==========

   Mistral github.io: https://dev-breeze-com.github.io/mistral  
   Mistral v1.0.0: https://www.github.com/dev-breeze-com/mistral  

