#!/bin/sh
###############################################
# Delete unnecessary users from Alpine linux
# Applies to alpine (version 3.2 - Latest 2015-10-20)
# Maintained by: brian.mcmillan.architect@gmail.com
# Created: 2015-10-21
###############################################

# Delete unneeded users
# /etc/passwd #######################
deluser apache
deluser cyrus
deluser ftp
deluser games
deluser gdm
deluser lp
deluser mysql
deluser news
deluser nut
deluser postfix
deluser postgres
deluser postmaster
deluser smmsp
deluser squid
deluser vpopmail
deluser xfs

# Delete unneeded groups
# etc/group #######################
delgroup apache
delgroup audio
delgroup cdrom
delgroup cdrw
delgroup floppy
delgroup ftp
delgroup games
delgroup gdm
delgroup kvm
delgroup lp
delgroup mysql
delgroup news
delgroup nut
delgroup postdrop
delgroup postfix
delgroup postgres
delgroup smmsp
delgroup squid
delgroup tape
delgroup usb
delgroup vpopmail
delgroup www-data
