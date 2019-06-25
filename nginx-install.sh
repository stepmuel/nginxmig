#!/usr/bin/env bash

# Base directory of this script
DIR="$(dirname "$0")"

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Configuration will fail since port 80 is already in use
apt install nginx -y

# Disable site which uses port 80
rm /etc/nginx/sites-enabled/default

# Add custom configuration
cp "$DIR/nginx-conf/proxy-nobuff.conf" /etc/nginx/snippets/.
cp "$DIR/nginx-conf/apache-default" /etc/nginx/sites-available/.

# Enable test site
ln -s /etc/nginx/sites-available/apache-default /etc/nginx/sites-enabled/.

# Finish configuration
dpkg --configure nginx-core
dpkg --configure nginx
