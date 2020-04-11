FROM centos:base

COPY google-chrome.repo /etc/yum.repos.d/

RUN yum install -y epel-release \
    && yum install -y google-chrome

EXPOSE 9222

ENTRYPOINT [ "google-chrome", \
    "--headless", \
    "--disable-gpu", \
    "--no-sandbox", \
    "--hide-scrollbars", \
    "--remote-debugging-address=0.0.0.0", \
    "--remote-debugging-port=9222" ]
