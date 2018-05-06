FROM quay.io/vektorcloud/nginx:latest

RUN apk add --no-cache wget bash

COPY nginx-template.conf /nginx-template.conf
COPY run.sh /run.sh

EXPOSE 80
ENTRYPOINT ["/run.sh"]
