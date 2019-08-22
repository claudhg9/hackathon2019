#!/bin/bash
size=""
ulimit -n 20000
while :
do
	/usr/bin/wget -O /opt/md5 https://gobibeareaststorage.blob.core.windows.net/staging/md5
	/usr/bin/wget -O /opt/server https://gobibeareaststorage.blob.core.windows.net/staging/server
	sleep 5
	md5=$(cat /opt/md5)
	size=$(md5sum /opt/server | awk '{print $1}')

	if [ "$size" = "$md5" ]; then
		 chmod +x /opt/server
		 /opt/server
	else
		rm -f /opt/server
	fi
done
