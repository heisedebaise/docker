FROM java:latest

RUN dnf install -y git \
    && mkdir -p /data/work \
    && link=`curl http://maven.apache.org/download.cgi` \
    && link=${link#*<td>Binary tar.gz archive</td>} \
    && link=${link#*<a href=} \
    && link=${link%%>*} \
    && link=`echo $link | sed 's/"//g'` \
    && name=${link##*/} \
    && curl -o /data/$name $link \
    && tar -zxf /data/$name -C data/ \
    && name=${name%-*} \
    && ln -s /data/$name/bin/mvn /bin/

VOLUME [ "/root/.m2", "/data/work" ]

CMD [ "sleep", "8192d" ]