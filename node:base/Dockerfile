from centos:base

ENV NODE_VERSION 8.3.0
ENV YARN_VERSION 0.27.5

RUN set -ex \
    && curl -SLO https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz \
    && tar -xJf node-v$NODE_VERSION-linux-x64.tar.xz -C /usr/local --strip-components=1 \
    && rm node-v$NODE_VERSION-linux-x64.tar.xz \
    && curl -fSLO --compressed https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz \
    && mkdir -p /opt/yarn \
    && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/yarn --strip-components=1 \
    && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
    && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg \
    && rm yarn-v$YARN_VERSION.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
    && echo '#!/bin/bash' > /node.sh \
    && echo '' >> /node.sh \
    && echo 'mkdir -p /data/log' >> /node.sh \
    && echo 'echo "======================= npm install =======================" >> /data/log/console.out' >> /node.sh \
    && echo 'npm --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist install >> /data/log/console.out' >> /node.sh \
    && echo 'echo "======================= $@ =======================" >> /data/log/console.out' >> /node.sh \
    && echo '$@ >> /data/log/console.out' >> /node.sh \
    && chmod +x /node.sh

VOLUME /data

WORKDIR /data/app

ENTRYPOINT ["/node.sh"]
