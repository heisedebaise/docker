FROM centos:base

RUN dnf install -y epel-release \
    && dnf install -y certbot \
    && mkdir -p /certbot/cert

COPY renew.sh /certbot/

RUN chmod +x /certbot/renew.sh

EXPOSE 80/tcp 443/tcp

CMD [ "/certbot/renew.sh" ]
