from centos:base

RUN yum install -y epel-release \
    && yum install -y nginx

VOLUME ["/etc/nginx/conf.d","/var/log/nginx"]

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["nginx","-g","daemon off;"]
