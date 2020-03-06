FROM centos:base

RUN yum install -y epel-release \
    && yum install -y certbot \
    && mkdir -p /certbot/cert

COPY renew.sh /certbot/

RUN chmod +x /certbot/renew.sh

VOLUME [ "/certbot/cert" ]

CMD [ "/certbot/renew.sh" ]
