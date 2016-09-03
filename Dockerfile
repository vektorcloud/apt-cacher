FROM quay.io/vektorcloud/nginx:latest

RUN apk add --no-cache wget bash

COPY nginx.conf /etc/nginx/nginx.conf
COPY run.sh /run.sh

EXPOSE 80
CMD /bin/bash /app/run.sh
