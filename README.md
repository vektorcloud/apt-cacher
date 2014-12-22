apt-cacher
==========
Apt-catcher is a simple apt package cache suitable in any case where an entire package mirror may be overkill. Based on the post [here](http://yeupou.wordpress.com/2014/01/28/caching-debianetc-apt-repositories-on-your-local-server-with-nginx-and-dsniff/)

Getting Started
-----------

Run:

```
docker run -ti -p 80:80 bcicen/apt-cacher
```

and update your local apt sources.list to point to the 

Usage
-----------
