FROM centos:base

RUN yum install -y epel-release \
    && yum install -y certbot \
    && mkdir -p /certbot/certs

COPY *.sh /certbot/

VOLUME [ "/certbot/certs" ]

CMD [ "/certbot/renew.sh" ]
