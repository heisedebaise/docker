FROM centos:base

ENV NODE_VERSION 8.4.0

RUN set -ex \
    && wget https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz \
    && tar -xJf node-v$NODE_VERSION-linux-x64.tar.xz -C /usr/local --strip-components=1 \
    && rm node-v$NODE_VERSION-linux-x64.tar.xz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
    && mkdir -p /data/config \
    && mkdir -p /data/app \
    && mkdir -p /data/log \
    && echo '#!/bin/bash' > /node.sh \
    && echo '' >> /node.sh \
    && echo 'if [ -n "ls /data/config/*.sh" ];' >> /node.sh \
    && echo 'then' >> /node.sh \
    && echo '   for file in /data/config/*.sh' >> /node.sh \
    && echo '   do' >> /node.sh \
    && echo '       chmod +x $file' >> /node.sh \
    && echo '       sh $file' >> /node.sh \
    && echo '   done' >> /node.sh \
    && echo 'fi' >> /node.sh \
    && echo '' >> /node.sh \
    && echo 'mkdir -p /data/log' >> /node.sh \
    && echo 'echo "======================= npm install =======================" >> /data/log/console.out' >> /node.sh \
    && echo 'npm --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist install >> /data/log/console.out' >> /node.sh \
    && echo 'echo "======================= $@ =======================" >> /data/log/console.out' >> /node.sh \
    && echo '$@ >> /data/log/console.out' >> /node.sh \
    && chmod +x /node.sh

VOLUME ["/data/config", "/data/app", "/data/log"]

WORKDIR /data/app

ENTRYPOINT ["/node.sh"]
