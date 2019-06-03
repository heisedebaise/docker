FROM centos:base

RUN yum install -y epel-release \
    && yum install -y golang \
    && mkdir -p /usr/lib/go

ENV GOPATH=/usr/lib/go
