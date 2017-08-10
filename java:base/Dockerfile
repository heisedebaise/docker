from centos:base

# install jdk-8u144.
RUN version=8u144 \
    && wget --no-check-certificate --no-cookies --header 'Cookie: oraclelicense=accept-securebackup-cookie' http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.rpm \
    && yum install -y jdk-$version-linux-x64.rpm \
    && rm -rf jdk-$version-linux-x64.rpm

ENV JAVA_HOME /usr/java/latest
ENV PATH $PATH:$JAVA_HOME/bin
