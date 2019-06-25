#!/usr/bin/env bash

sed -i 's/VirtualHost \*:80/VirtualHost \*:80 \*:85/g' "$@"
