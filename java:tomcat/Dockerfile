FROM java:base

# install tomcat-8.5.20
RUN cd /usr/java \
    && version=8.5.20 \
    && wget http://www-eu.apache.org/dist/tomcat/tomcat-8/v$version/bin/apache-tomcat-$version.tar.gz \
    && tar -zxf apache-tomcat-$version.tar.gz \
    && rm -rf apache-tomcat-$version.tar.gz \
    && cd apache-tomcat-$version \
    && sed -i '/# OS specific support/i\JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"\n' bin/catalina.sh \
    && sed -i 's/redirectPort="8443" \/>/redirectPort="8443" \n               URIEncoding="UTF-8" \/>/g' conf/server.xml \
    && sed -i 's/URIEncoding="UTF-8" \/>/URIEncoding="UTF-8" \n               compression="on" \/>/g' conf/server.xml \
    && sed -i 's/compression="on" \/>/compression="on" \n               compressionMinSize="2048" \/>/g' conf/server.xml \
    && sed -i 's/compressionMinSize="2048" \/>/compressionMinSize="2048" \n               compressableMimeType="appliaction\/json" \/>/g' conf/server.xml \
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

ENV CATALINA_HOME /usr/java/apache-tomcat-8.5.20

VOLUME ["/data/config","/data/webapps","/data/logs"]

EXPOSE 8080

# service on boot
WORKDIR $CATALINA_HOME
ENTRYPOINT bin/run.sh
