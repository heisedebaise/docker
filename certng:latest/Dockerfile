FROM centos:base

COPY run.sh /bin/certng
COPY renew.sh /bin/certng-renew

RUN dnf install -y epel-release \
    && dnf install -y crontabs python3 nginx \
    && ln -s /bin/python3 /bin/python \
    && ln -s /bin/pip3 /bin/pip \
    && mkdir -p /certbot/cert \
    && curl -o /certbot/certbot-auto https://dl.eff.org/certbot-auto \
    && chmod +x /certbot/certbot-auto \
    && /certbot/certbot-auto -n --install-only \
    && ln -s /opt/eff.org/certbot/venv/bin/certbot /bin/certbot \
    && sed -i '38,57s/^/#/' /etc/nginx/nginx.conf \
    && chmod +x /bin/certng \
    && chmod x /bin/certng-renew \
    && echo '0 3 * * * root /bin/certng-renew' >> /etc/crontab

EXPOSE 80/tcp 443/tcp

CMD [ "/bin/certng" ]