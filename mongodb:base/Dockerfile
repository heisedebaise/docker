from centos:base

RUN yum install -y epel-release \
    && yum install -y mongodb-server mongodb \
    && mkdir -p /data/db

VOLUME ["/data"]

EXPOSE 27017

ENTRYPOINT mongod
