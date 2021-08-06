FROM centos:base

COPY google-chrome.repo /etc/yum.repos.d/

RUN dnf install -y google-chrome \
    && dnf module install -y nodejs:14 \
    && npm install -g yarn
