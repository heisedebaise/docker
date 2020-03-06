FROM centos:base

RUN yum install -y epel-release \
    && yum install -y certbot \
    && mkdir -p /certbot/certs

COPY *.sh /certbot/

RUN chmod +x /certbot/renew.sh

VOLUME [ "/certbot/certs" ]

CMD [ "/certbot/renew.sh" ]
