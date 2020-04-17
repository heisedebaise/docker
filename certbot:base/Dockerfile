FROM centos:base

RUN mkdir -p /certbot/cert \
    && curl -o /certbot/certbot-auto https://dl.eff.org/certbot-auto \
    && chmod +x /certbot/certbot-auto \
    && /certbot/certbot-auto -n --install-only \
    && ln -s /opt/eff.org/certbot/venv/bin/certbot /bin/certbot

COPY renew.sh /certbot/

RUN chmod +x /certbot/renew.sh

EXPOSE 80/tcp 443/tcp

CMD [ "/certbot/renew.sh" ]
