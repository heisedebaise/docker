FROM java:base

# install tomcat-9M22
WORKDIR /usr/java

RUN wget http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-9/v9.0.0.M22/bin/apache-tomcat-9.0.0.M22.tar.gz \
    && tar -zxf apache-tomcat-9.0.0.M22.tar.gz \
    && rm -rf apache-tomcat-9.0.0.M22.tar.gz \
    && cd apache-tomcat-9.0.0.M22 \
    && sed -i '/# OS specific support/i\JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"\n' bin/catalina.sh \
    && sed -i 's/redirectPort="8443" \/>/redirectPort="8443" URIEncoding="UTF-8" \/>/g' conf/server.xml \
    && rm -rf webapps \
    && rm -rf logs \
    && mkdir -p /data/config \
    && mkdir -p /data/webapps \
    && mkdir -p /data/logs \
    && ln -s /data/webapps \
    && ln -s /data/logs \
    && echo '#!/bin/bash' > bin/run.sh \
    && echo '' >> bin/run.sh \
    && echo 'if [ -n "ls /data/config/*.sh" ];' >> bin/run.sh \
    && echo 'then' >> bin/run.sh \
    && echo '   for file in /data/config/*.sh' >> bin/run.sh \
    && echo '   do' >> bin/run.sh \
    && echo '       chmod +x $file' >> bin/run.sh \
    && echo '       sh $file' >> bin/run.sh \
    && echo '   done' >> bin/run.sh \
    && echo 'fi' >> bin/run.sh \
    && echo '' >> bin/run.sh \
    && echo 'bin/catalina.sh run' >> bin/run.sh \
    && echo '' >> bin/run.sh \
    && chmod +x bin/run.sh

ENV CATALINA_HOME /usr/java/apache-tomcat-9.0.0.M22

VOLUME ["/data/config","/data/webapps","/data/logs"]

# service on boot
WORKDIR $CATALINA_HOME
ENTRYPOINT bin/run.sh
