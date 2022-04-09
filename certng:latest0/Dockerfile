FROM centos:base

COPY run.sh /bin/certng
COPY renew.sh /bin/certng-renew

RUN dnf install -y crontabs nginx python3 augeas-libs \
    && python3 -m venv /opt/certbot/ \
    && /opt/certbot/bin/pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple/ \
    && /opt/certbot/bin/pip install certbot certbot-nginx -i https://pypi.tuna.tsinghua.edu.cn/simple/ \
    && ln -s /opt/certbot/bin/certbot /usr/bin/certbot \
    && sed -i '38,57s/^/#/' /etc/nginx/nginx.conf \
    && chmod +x /bin/certng \
    && chmod +x /bin/certng-renew \
    && echo '0 3 * * * root /bin/certng-renew' >> /etc/crontab

COPY to-https.html /certbot/to-https/index.html

EXPOSE 80/tcp 443/tcp

CMD [ "/bin/certng" ]