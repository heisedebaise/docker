FROM centos:base

RUN yum install -y epel-release \
    && yum install -y nginx \
    && sed -i '38,57s/^/#/' /etc/nginx/nginx.conf

EXPOSE 80 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
