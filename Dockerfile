FROM quay.io/vektorcloud/nginx:latest

RUN apk add --no-cache wget bash

COPY . /app

RUN /bin/bash /app/mkdirs.sh && \
    mv -v /app/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD /bin/bash /app/run.sh
