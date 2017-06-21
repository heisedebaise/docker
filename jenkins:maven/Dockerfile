FROM jenkins

# install maven-3.5.0
USER root

WORKDIR /usr/java

RUN wget http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz \
    && tar -zxf apache-maven-3.5.0-bin.tar.gz \
    && rm -rf apache-maven-3.5.0-bin.tar.gz

ENV MAVEN_HOME /usr/java/apache-maven-3.5.0
ENV PATH $PATH:$MAVEN_HOME/bin

VOLUME ["/root/.m2"]

WORKDIR /root/.m2
