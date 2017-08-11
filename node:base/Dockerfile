from centos:base

ENV NODE_VERSION 8.3.0
ENV YARN_VERSION 0.27.5

RUN set -ex \
    && for key in \
        9554F04D7259F04124DE6B476D5A82AC7E37093B \
        94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
        FD3A5288F042B6850C66B31F09FE44734EB7990E \
        71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
        DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
        B9AE9905FFD7803F25714661B63B535A4C206CA9 \
        C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
        56730D5401028683275BD23C23EFEFE93C4CFFFE \
        6A010C5166006599AA17F08146C2130DFD2497F5 \
    ; do \
        gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
        gpg --keyserver keyserver.pgp.com --recv-keys "$key" || \
        gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" ; \
    done \
    && curl -SLO https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz \
    && curl -SLO --compressed https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc \
    && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
    && grep " node-v$NODE_VERSION-linux-x64.tar.xz\$" SHASUMS256.txt | sha256sum -c - \
    && tar -xJf node-v$NODE_VERSION-linux-x64.tar.xz -C /usr/local --strip-components=1 \
    && rm node-v$NODE_VERSION-linux-x64.tar.xz SHASUMS256.txt.asc SHASUMS256.txt \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
    && curl -fSLO --compressed https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz \
    && curl -fSLO --compressed https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz.asc \
    && gpg --batch --verify yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz \
    && mkdir -p /opt/yarn \
    && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/yarn --strip-components=1 \
    && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
    && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg \
    && rm yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz \
    && echo '#!/bin/bash' > /run.sh \
    && echo '' >> /run.sh \
    && echo 'npm --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist install --production' >> /run.sh \
    && echo 'mkdir -p /data/log' >> /run.sh \
    && echo 'date >> /data/log/start' >> /run.sh \
    && echo 'npm start' >> /run.sh \
    && chmod +x /run.sh

VOLUME /data

WORKDIR /data/app

ENTRYPOINT /run.sh