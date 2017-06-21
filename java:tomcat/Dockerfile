FROM java:base

# install tomcat-9M21
WORKDIR /usr/java

RUN wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-9/v9.0.0.M21/bin/apache-tomcat-9.0.0.M21.tar.gz \
    && tar -zxf apache-tomcat-9.0.0.M21.tar.gz \
    && rm -rf apache-tomcat-9.0.0.M21.tar.gz \
    && cd apache-tomcat-9.0.0.M21 \
    && sed -i '/# OS specific support/i\JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"\n' bin/catalina.sh \
    && rm -rf webapps/*

ENV CATALINA_HOME /usr/java/apache-tomcat-9.0.0.M21

VOLUME ["/usr/java/apache-tomcat-9.0.0.M21/webapps"]
VOLUME ["/usr/java/apache-tomcat-9.0.0.M21/logs"]

# service on boot
WORKDIR $CATALINA_HOME
ENTRYPOINT bin/catalina.sh run
