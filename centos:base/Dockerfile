FROM centos

RUN yum update -y \
    && rm -rf /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && localedef -i zh_CN -c -f UTF-8 zh_CN.UTF-8

ENV LC_ALL zh_CN.utf8
