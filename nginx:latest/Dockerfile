FROM centos:base

RUN dnf install -y epel-release \
    && dnf install -y nginx \
    && sed -i '38,57s/^/#/' /etc/nginx/nginx.conf

EXPOSE 80/tcp 443/tcp

CMD ["nginx", "-g", "daemon off;"]
