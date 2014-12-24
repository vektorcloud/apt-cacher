CONTAINER_IP=$(getent hosts `hostname` | awk '{print $1}')
sed -i "s/_CONTAINER_IP_/$CONTAINER_IP/g" /etc/dnsspoof.conf
sed -i "s/_CONTAINER_IP_/$CONTAINER_IP/g" /etc/nginx/nginx.conf
/usr/sbin/dnsspoof -i eth0 -f /etc/dnsspoof.conf &
/usr/sbin/nginx -c /etc/nginx/nginx.conf 
tail -f /var/log/nginx/*
