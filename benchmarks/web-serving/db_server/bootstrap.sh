#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Web server IP is a mandatory parameter."
  exit 1
fi

WEB_SERVER_IP=$1

# workaround for overlayfs:
# https://docs.docker.com/engine/userguide/storagedriver/overlayfs-driver/#limitations-on-overlayfs-compatibility
find /var/lib/mysql -type f -exec touch {} \;

# Update the hostname/IP to that of the webserver
sed -i -e"s/HOST_IP/${WEB_SERVER_IP}:8080/" /elgg_db.dump
chmod a+x /execute.sh
sync
bash -c "/execute.sh root" #root is the root pass
