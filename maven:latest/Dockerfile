FROM java:17

RUN apk add curl \
 && mkdir -p /work \
 && version=`curl https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/` \
 && version=${version##*href} \
 && version=${version:2} \
 && version=${version%%\/*} \
 && curl -o /apache-maven-$version-bin.tar.gz https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/$version/binaries/apache-maven-$version-bin.tar.gz \
 && tar -zxf /apache-maven-$version-bin.tar.gz \
 && sed -i '/"\$MAVEN_SKIP_RC"/i\MAVEN_OPTS="-Dfile.encoding=UTF-8"\n' /apache-maven-$version/bin/mvn \
 && ln -s /apache-maven-$version/bin/mvn /bin/

VOLUME [ "/root/.m2", "/work" ]