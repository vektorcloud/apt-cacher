CONTAINER_IP=$(getent hosts `hostname` | awk '{print $1}')
RESOLVER=$(grep nameserver /etc/resolv.conf | awk '{print $2}' | head -1)
sed -i "s/_RESOLVER_/$RESOLVER/g" /etc/nginx/nginx.conf

/usr/sbin/nginx -c /etc/nginx/nginx.conf
