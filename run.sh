#!/bin/bash

CACHEDIR="/srv/www/apt"
PKGREPO_URL="http://archive.ubuntu.com/ubuntu/pool/main/"

function init_cachedirs() {
  # create dirs for package cache
  echo -n "initializing cache directories... "

  mkdir -p ${CACHEDIR}/debian
  mkdir -p ${CACHEDIR}/debian-security

  # create top-level directories for ubuntu as nginx will not create them recursively
  cd /tmp/
  wget --force-directories -r --level=1 -R '*.html*,*.gif' --quiet $PKGREPO_URL
  mv archive.ubuntu.com/* /srv/www/apt/
  
  chown nginx. -R /srv/www/apt
  echo "done"
}

[ -d $CACHEDIR ] || init_cachedirs

CONTAINER_IP=$(getent hosts `hostname` | awk '{print $1}')
RESOLVER=$(grep nameserver /etc/resolv.conf | awk '{print $2}' | head -1)
sed -i "s/_RESOLVER_/$RESOLVER/g" /etc/nginx/nginx.conf

exec /usr/sbin/nginx -c /etc/nginx/nginx.conf
