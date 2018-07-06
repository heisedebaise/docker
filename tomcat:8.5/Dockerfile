FROM java:1.8

ENV VERSION 8.5.32

ENV CATALINA_HOME /apache-tomcat-$VERSION

RUN yum install -y crontabs \
    && curl -O https://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v$VERSION/bin/apache-tomcat-$VERSION.tar.gz \
    && tar -zxf apache-tomcat-$VERSION.tar.gz \
    && rm -rf apache-tomcat-$VERSION.tar.gz \
    && cd apache-tomcat-$VERSION \
    && sed -i '/# OS specific support/i\JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"\n' bin/catalina.sh \
    && sed -i 's/>> "$CATALINA_OUT" 2>&1 "&"/>> "$CATALINA_OUT" 2>\&1/g' bin/catalina.sh \
    && sed -i 's/port="8080"/port="8080"\n               compression="on"\n               compressionMinSize="4096"\n               compressableMimeType="application\/json"\n              /' conf/server.xml \
    && rm -rf webapps \
    && rm -rf logs \
    && mkdir -p /data/config \
    && mkdir -p /data/webapps \
    && mkdir -p /data/logs \
    && ln -s /data/webapps \
    && ln -s /data/logs

WORKDIR $CATALINA_HOME

COPY *.sh bin/

RUN chmod +x bin/timer.sh \
    && echo "0 4 * * * $CATALINA_HOME/bin/timer.sh" > /var/spool/cron/root \
    && chmod +x bin/run.sh

VOLUME ["/data/config", "/data/webapps", "/data/logs"]

EXPOSE 8080

CMD ["bin/run.sh"]
