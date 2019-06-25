#!/usr/bin/env bash

# Base directory of this script
DIR="$(dirname "$0")"
NAME=$1

sed "s/{\$name}/$NAME/g" "$DIR/nginx-conf/apache-le-ssl" > "/etc/nginx/sites-available/$NAME"

ln -s "/etc/nginx/sites-available/$NAME" /etc/nginx/sites-enabled/.
