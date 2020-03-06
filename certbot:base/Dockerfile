FROM centos:base

RUN mkdir -p /certbot/certs

COPY certbot-auto /certbot/
COPY run.sh /certbot/

RUN chmod +x /certbot/certbot-auto \
    && chmod +x /certbot/run.sh \
    && /certbot/certbot-auto -y

VOLUME [ "/certbot/certs" ]

CMD [ "/certbot/run.sh" ]