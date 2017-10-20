FROM java:base

# install tomcat-8.5.23
RUN version=8.5.23 \
    && wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-8/v$version/bin/apache-tomcat-$version.tar.gz \
    && tar -zxf apache-tomcat-$version.tar.gz \
    && rm -rf apache-tomcat-$version.tar.gz \
    && cd apache-tomcat-$version \
    && sed -i '/# OS specific support/i\JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"\n' bin/catalina.sh \
    && sed -i 's/port="8080"/port="8080"\n               compression="on"\n               compressionMinSize="4096"\n               compressableMimeType="application\/json"\n              /' conf/server.xml \
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
    && echo 'bin/startup.sh' >> bin/run.sh \
    && echo 'sleep 1024d' >> bin/run.sh \
    && echo '' >> bin/run.sh \
    && chmod +x bin/run.sh

ENV CATALINA_HOME /apache-tomcat-8.5.23

VOLUME ["/data/config","/data/webapps","/data/logs"]

EXPOSE 8080

# service on boot
WORKDIR $CATALINA_HOME
ENTRYPOINT ["bin/run.sh"]
