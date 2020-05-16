FROM centos:base

COPY google-chrome.repo /etc/yum.repos.d/

RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash - \
    && dnf install -y google-chrome nodejs \
    && npm install -g yarn
