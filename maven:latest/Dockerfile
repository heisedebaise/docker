FROM java:latest

RUN mkdir -p /data/work \
    && version=`curl https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/` \
    && version=${version##*href} \
    && version=${version:2} \
    && version=${version%%\/*} \
    && curl -o /data/apache-maven-$version-bin.tar.gz https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/$version/binaries/apache-maven-$version-bin.tar.gz \
    && tar -zxf /data/apache-maven-$version-bin.tar.gz -C /data/ \
    && sed -i '/"\$MAVEN_SKIP_RC"/i\MAVEN_OPTS="-Dfile.encoding=UTF-8"\n' /data/apache-maven-$version/bin/mvn \
    && ln -s /data/$name/bin/mvn /bin/

VOLUME [ "/root/.m2", "/data/work" ]

CMD [ "sleep", "1024d" ]