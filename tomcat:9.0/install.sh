#!/bin/bash

version=`curl https://tomcat.apache.org/whichversion.html`
version=${version#*Apache Tomcat Versions}
version=${version#*9.0.x}
version=${version#*<td>}
version=${version%%</td>*}
curl -O https://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-9/v$version/bin/apache-tomcat-$version.tar.gz
tar -zxf apache-tomcat-$version.tar.gz
rm -rf apache-tomcat-$version.tar.gz

cd apache-tomcat-$version
sed -i '/# OS specific support/i\JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Dfile.encoding=UTF-8"\n' bin/catalina.sh
sed -i 's/>> "$CATALINA_OUT" 2>&1 "&"/>> "$CATALINA_OUT" 2>\&1/g' bin/catalina.sh
sed -i 's/port="8080"/port="8080"\n               compression="on"\n               compressionMinSize="4096"\n               compressableMimeType="application\/json"\n              /' conf/server.xml
rm -rf webapps
rm -rf logs
mkdir -p /data/config
mkdir -p /data/webapps
mkdir -p /data/logs
ln -s /data/webapps
ln -s /data/logs

sed -i "s,CATALINA_HOME,/apache-tomcat-$version," /data/bin/run.sh