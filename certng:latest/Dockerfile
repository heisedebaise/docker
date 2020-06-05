FROM centos:base

RUN mkdir -p /certbot/cert \
    && curl -o /certbot/certbot-auto https://dl.eff.org/certbot-auto \
    && chmod +x /certbot/certbot-auto \
    && /certbot/certbot-auto -n --install-only \
    && ln -s /opt/eff.org/certbot/venv/bin/certbot /bin/certbot \
    && dnf install -y epel-release crontabs \
    && dnf install -y nginx \
    && sed -i '38,57s/^/#/' /etc/nginx/nginx.conf \
    && echo '5 16 * * * root certbot renew --nginx >> /var/log/certbot' >> /etc/crontab

COPY run.sh /bin/certng

RUN chmod +x /bin/certng

EXPOSE 80/tcp 443/tcp

CMD [ "/bin/certng" ]