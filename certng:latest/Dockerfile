FROM alpine:base

RUN apk add gcc g++ libffi-dev python3-dev augeas-libs nginx \
 && python3 -m venv /opt/certbot/ \
 && /opt/certbot/bin/pip install --upgrade pip \
 && /opt/certbot/bin/pip install certbot certbot-nginx \
 && ln -s /opt/certbot/bin/certbot /usr/bin/certbot \
 && mv /etc/nginx/http.d/default.conf /etc/nginx/http.d/default.conf.example \
 && mkdir -p /nginx/http \
 && mkdir -p /certng/bin

COPY https.html /nginx/http/index.html
COPY run.sh /certng/bin/

RUN chmod +x /certng/bin/run.sh

VOLUME [ "/etc/nginx/http.d/", "/var/log/nginx/", "/etc/letsencrypt", "/var/log/certbot" ]

EXPOSE 80
EXPOSE 443

CMD ["/certng/bin/run.sh"]