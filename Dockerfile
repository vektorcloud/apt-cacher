#

FROM ubuntu:latest
MAINTAINER Bradley Cicenas <bradley.cicenas@gmail.com>

RUN apt-get -yqq update && \
    apt-get install -yq nginx dsniff

ADD . /app 

RUN mkdir -p /srv/www/apt/debian /srv/www/apt/debian-security /srv/www/apt/ubuntu && \
    chown www-data. -R /srv/www/apt && \
    cd /srv/www && \
    for i in $(ls /srv/www/apt/); do ln -s /srv/www/apt/$i .; done  && \
    ln -nsf /app/dnsspoof.conf /etc/dnsspoof.conf && \
    ln -nsf /app/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD /bin/bash /app/run.sh
