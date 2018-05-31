FROM centos:base

COPY mongodb.repo /etc/yum.repos.d/

RUN yum install -y mongodb-org-server mongodb-org \
    && mkdir -p /data/db

VOLUME ["/data/db", "/var/log/mongodb"]

EXPOSE 27017

ENTRYPOINT ["mongod", "--bind_ip_all"]
