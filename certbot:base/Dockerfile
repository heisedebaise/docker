FROM centos:base

RUN mkdir -p /certbot/certs

COPY certbot-auto /certbot/

RUN chmod +x /certbot/certbot-auto \
    && chmod +x /certbot/run.sh \
    && /certbot/certbot-auto

VOLUME [ "/certbot/certs" ]

CMD [ "/certbot/run.sh" ]