#!/bin/sh
###############################################
# Hide unneeded services bu making them unexicutable
# Applies to alpine (version 3.2 - Latest 2015-10-20)
# Maintained by: brian.mcmillan.architect@gmail.com
# Created: 2015-10-21
# Remove by chmod 700 > Deny execute permissions (-rw-r--r--)
# Restore by chmod 755 > Deny execute permissions (-rwxr-xr-x)
# LINK: http://www.javascriptkit.com/script/script2/chmodcal3.shtml
###############################################

# Hide unneeded services by making them unexecutable
# /sbin #######################
chmod 700 /sbin/setup-acf
chmod 700 /sbin/setup-alpine
chmod 700 /sbin/setup-apkcache
chmod 700 /sbin/setup-apkrepos
chmod 700 /sbin/setup-bootable
chmod 700 /sbin/setup-disk
chmod 700 /sbin/setup-dns
chmod 700 /sbin/setup-gparted-desktop
chmod 700 /sbin/setup-hostname
chmod 700 /sbin/setup-interfaces
chmod 700 /sbin/setup-keymap
chmod 700 /sbin/setup-lbu
chmod 700 /sbin/setup-mta
chmod 700 /sbin/setup-ntp
chmod 700 /sbin/setup-proxy
chmod 700 /sbin/setup-sshd
chmod 700 /sbin/setup-timezone
chmod 700 /sbin/setup-xen-dom0
chmod 700 /sbin/setup-xorg-base

# /usr/sbin #######################
# /usr/sbin/ftpd -> /bin/busybox
# chmod 700 /usr/sbin/ftpd
# chmod 700 /usr/sbin/httpd
# chmod 700 /usr/sbin/sendmail
