FROM centos:base

COPY run.sh /bin/certng
COPY renew.sh /bin/certng-renew

RUN mkdir -p /certbot/cert \
    && curl -o /certbot/certbot-auto https://dl.eff.org/certbot-auto \
    && chmod +x /certbot/certbot-auto \
    && /certbot/certbot-auto -n --install-only \
    && ln -s /opt/eff.org/certbot/venv/bin/certbot /bin/certbot \
    && dnf install -y epel-release crontabs \
    && dnf install -y nginx \
    && sed -i '38,57s/^/#/' /etc/nginx/nginx.conf \
    && chmod +x /bin/certng \
    && chmod x /bin/certng-renew \
    && echo '5 16 * * * root /bin/certng-renew' >> /etc/crontab

EXPOSE 80/tcp 443/tcp

CMD [ "/bin/certng" ]