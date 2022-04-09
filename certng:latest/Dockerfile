FROM alpine:base

RUN apk add nginx gcc g++ libffi-dev python3-dev augeas-libs \
 && sed -i 's,#include /etc/nginx/conf\.d/\*\.conf;,include /etc/nginx/conf.d/*.conf;,g' /etc/nginx/nginx.conf \
 && python3 -m venv /opt/certbot/ \
 && /opt/certbot/bin/pip install --upgrade pip \
 && /opt/certbot/bin/pip install certbot certbot-nginx \
 && ln -s /opt/certbot/bin/certbot /usr/bin/certbot

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]