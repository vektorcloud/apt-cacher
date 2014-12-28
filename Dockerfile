#apt-cacher v0.2

FROM ubuntu:latest
MAINTAINER Bradley Cicenas <bradley.cicenas@gmail.com>

RUN apt-get -yqq update && \
    apt-get install -yq nginx

ADD . /app 

RUN mkdir -p /srv/www/apt/debian /srv/www/apt/debian-security /srv/www/apt/ubuntu/pool/main && \
    chown www-data. -R /srv/www/apt && \
    cd /srv/www && \
    for i in $(ls /srv/www/apt/); do ln -s /srv/www/apt/$i .; done  && \
    ln -nsf /app/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD /bin/bash /app/run.sh
