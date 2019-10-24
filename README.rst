OpenBSD compatibility script for Debian
=======================================

This installs symlinks and wrappers for usual OpenBSD commands into a
Debian system to prevent muscle memory errors.

The following files and directories will be installed:

 * `/usr/local/bin/doas` (symlink to `sudo(8)`_)
 * `/usr/local/sbin/rcctl` (wrapper around `service(8)`_)
 * `/usr/local/sbin/pkg_add` (wrapper around `apt(8)`_)
 * `/usr/local/sbin/pkg_delete` (wrapper around `apt(8)`_)
 * `/usr/local/sbin/pkg_info` (wrapper around `apt(8)`_)
 * `/usr/local/sbin/syspatch` (wrapper around `apt-get(8)`_)
 * `/usr/local/sbin/sysupgrade` (wrapper around `apt(8)`_)
 * `/etc/rc.d` (symlink to `/etc/init.d`)
 * `nvi`_ package (as `vi(1)`_)
 * `netcat-openbsd`_ package (as `nc(1)`_)
 * `signify-openbsd`_ package


Installation
------------

``$ sudo make install``


Examples
--------

.. code-block:: ksh

   pkg_info -Q smtpd
   doas pkg_add opensmtpd
   doas pkg_add -u
   doas rcctl enable opensmtpd
   doas rcctl start smtpd
   rcctl check smtpd
   doas rcctl stop smtpd
   doas pkg_delete opensmtpd
   doas pkg_delete -a
   doas syspatch -c
   doas syspatch
   doas sysupgrade -n


CAVEATS
-------

Make sure that the directories are correctly specified in the Makefile.
Otherwise the /install/ and /uninstall/ targets may destroy 
configuration and system files.

.. _apt(8): https://manpages.debian.org/apt.8
.. _apt-get(8): https://manpages.debian.org/apt-get.8
.. _nc(1): https://manpages.debian.org/sid/netcat-openbsd/nc.1
.. _sudo(8): https://manpages.debian.org/sudo.8
.. _service(8): https://manpages.debian.org/service.8
.. _vi(1): https://manpages.debian.org/sid/nvi/vi.1
.. _netcat-openbsd: https://packages.debian.org/sid/netcat-openbsd
.. _nvi: https://packages.debian.org/sid/nvi
.. _signify-openbsd: https://packages.debian.org/sid/signify-openbsd
