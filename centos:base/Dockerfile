FROM docker.io/library/centos

RUN dnf update -y \
    && rm -rf /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dnf install -y langpacks-zh_CN \
    && sed -i 's/en_US/zh_CN/' /etc/locale.conf
