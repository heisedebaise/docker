FROM centos

# init env.
RUN yum update -y \
    && yum install -y wget kde-l10n-Chinese \
    && yum reinstall -y glibc-common \
    && rm -rf /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && localedef -i zh_CN -c -f UTF-8 zh_CN.UTF-8

ENV LC_ALL zh_CN.utf8

# install jdk-8u131.
RUN wget --no-check-certificate --no-cookies --header 'Cookie: oraclelicense=accept-securebackup-cookie' http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm \
    && yum install -y jdk-8u131-linux-x64.rpm \
    && rm -rf jdk-8u131-linux-x64.rpm

ENV JAVA_HOME /usr/java/latest
ENV PATH $PATH:$JAVA_HOME/bin
