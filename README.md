# apt-cacher

Apt-cacher is a simple apt package cache for use with Docker, but suitable in any case where an entire package mirror may be overkill.

## Getting Started

Run:

```
docker run -d --name=apt-cacher quay.io/vektorcloud/apt-cacher
```

After apt-cacher is up, start any following containers linked to the cache:

* Ubuntu:
``` 
docker run -ti --link apt-cacher:security.ubuntu.com --link apt-cacher:archive.ubuntu.com ubuntu:latest /bin/bash
```

* Debian:
```
docker run -ti --link apt-cacher:security.debian.org --link apt-cacher:ftp.debian.org debian:latest /bin/bash
```

To alternatively avoid having to link every running container, publish port 80 to the host:
```
docker run -d -p 80:80 --name=apt-cacher quay.io/vektorcloud/apt-cacher
```
and add an /etc/hosts entry on the host pointing to localhost or the address of the interface you have docker bound to:
```
127.0.0.1    ftp.debian.org
127.0.0.1    security.debian.org
127.0.0.1    archive.ubuntu.com
127.0.0.1    security.ubuntu.com
```
