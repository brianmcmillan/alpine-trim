#!/bin/sh
###############################################
# System auditing script
# Maintained by: brian.mcmillan.architect@gmail.com
# Created: 2015-10-23
###############################################

# Setup the file
# now=$(date +"%Y-%m-%dT%H:%M:%S.%N%:z")
now=$(date +"%Y-%m-%dT%H:%M:%S")
file=/opt/audit/sysaudit_$now.txt
#mkdir /usr/local/audit/ -p

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $file
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $file
echo $now >> $file
whoami >> $file
uname -a >> $file
uptime >> $file
#echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $file
#echo "DOCKER CONFIG #######################" >> $file
#echo "## docker version #######################" >> $file
#docker version >> $file
#echo "## docker info #######################" >> $file
#docker info >> $file

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $file
echo "SYSTEM CONFIG #######################" >> $file
echo "## /proc/version #######################" >> $file
cat /proc/version >> $file
echo "## /proc/cpuinfo #######################" >> $file
cat /proc/cpuinfo | egrep 'vendor_id|model name|cpu MHz|cache size|cpu cores' >> $file
echo "## /proc/meminfo #######################" >> $file
cat /proc/meminfo | egrep 'MemTotal|MemFree|MemAvailable|SwapTotal|SwapFree' >> $file
echo "## /proc/partitions #######################" >> $file
cat /proc/partitions >> $file
echo "## df #######################" >> $file
df >> $file
#echo "## mount #######################" >> $file
#mount >> $file

echo "## ifconfig #######################" >> $file
ifconfig >> $file
echo "## netstat #######################" >> $file
netstat -ral >> $file
echo "---------------------------------" >> $file
netstat -anp >> $file
echo "---------------------------------" >> $file
echo "hostname: " >> $file
cat /etc/hostname >> $file

echo "@@ USERS AND GROUPS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $file
echo "## /etc/passwd #################################" >> $file
cat /etc/passwd | sort >> $file
echo "## etc/group ###################################" >> $file
cat /etc/group | sort >> $file

echo "@@ SYSTEM SOFTWARE @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $file
echo "## shells ######################################" >> $file
cat /etc/shells >> $file
echo "## /bin - essential user binaries ##############" >> $file
ls -l /bin >> $file
echo "## /sbin - sys binaries ########################" >> $file
ls -l /sbin >> $file
echo "## /usr/bin - user commands ####################" >> $file
ls -l /usr/bin >> $file
echo "## /usr/sbin - non-essential user binaries #####" >> $file
ls -l /usr/sbin >> $file
echo "APK PACKAGES ###################################" >> $file
apk -vv info|sort >> $file

echo "@@ SYSTEM SERVICES @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $file
echo "## rc-service ######################################" >> $file
rc-service -l >> $file

echo "@@ APPLICATION CODE @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $file
echo "/tmp #######################" >> $file
ls -R /tmp >> $file
echo "/var #######################" >> $file
ls -R /var >> $file
echo "/srv #######################" >> $file
ls -R /srv >> $file

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $file
