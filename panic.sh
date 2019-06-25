#!/usr/bin/env bash

sudo cp /etc/apache2/ports.conf.default /etc/apache2/ports.conf
sudo service nginx stop
sudo service apache2 graceful
