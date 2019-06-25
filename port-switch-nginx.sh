#!/usr/bin/env bash

sed -i 's/listen 81/listen 80/g' "$@"
sed -i 's/listen 444/listen 443/g' "$@"
