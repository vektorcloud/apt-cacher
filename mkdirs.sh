#!/bin/bash

makedirs="/srv/www/apt/debian /srv/www/apt/debian-security"

#create dirs for cache
for dir in $makedirs; do
    mkdir -p $dir
done

#need to create top-level directories for ubuntu as nginx will not create
#them recursively
cd /tmp/
wget --force-directories -r --level=1 -R '*.html*,*.gif' --quiet\
  http://archive.ubuntu.com/ubuntu/pool/main/ 
mv -v archive.ubuntu.com/* /srv/www/apt/

chown www-data. -R /srv/www/apt
