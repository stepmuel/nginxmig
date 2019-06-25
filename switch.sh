#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

if [ ! -f /etc/apache2/ports.conf.default ]; then
    # Create backup. Used by 'panic.sh' to restore working state.
    cp /etc/apache2/ports.conf /etc/apache2/ports.conf.default
fi

# This should be done and verified in advanced
# sudo ./nginx-conf-switch.sh /etc/nginx/sites-available/*

echo "Listen 85" > /etc/apache2/ports.conf

service apache2 graceful
service nginx start
service nginx reload
