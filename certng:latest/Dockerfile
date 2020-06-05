FROM centos:base

COPY run.sh /bin/certng
COPY renew.sh /bin/certng-renew

RUN dnf install -y epel-release \
    && dnf install -y crontabs python3 nginx \
    && ln -s /bin/python3 /bin/python \
    && ln -s /bin/pip3 /bin/pip \
    && pip install pip -U -i https://mirrors.aliyun.com/pypi/simple/ \
    && pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ \
    && echo "$(sed 's/^nameserver /#nameserver /g' /etc/resolv.conf)" > /etc/resolv.conf \
    && echo 'nameserver 8.8.8.8' >> /etc/resolv.conf \
    && echo 'nameserver 4.4.4.4' >> /etc/resolv.conf \
    && mkdir -p /certbot/cert \
    && curl -o /certbot/certbot-auto https://dl.eff.org/certbot-auto \
    && chmod +x /certbot/certbot-auto \
    && /certbot/certbot-auto -n --install-only \
    && ln -s /opt/eff.org/certbot/venv/bin/certbot /bin/certbot \
    && sed -i '38,57s/^/#/' /etc/nginx/nginx.conf \
    && chmod +x /bin/certng \
    && chmod +x /bin/certng-renew \
    && echo '0 3 * * * root /bin/certng-renew' >> /etc/crontab

EXPOSE 80/tcp 443/tcp

CMD [ "/bin/certng" ]