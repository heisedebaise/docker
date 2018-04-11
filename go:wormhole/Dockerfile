FROM go:base

RUN yum install -y git \
    && git clone https://github.com/heisedebaise/wormhole.git \
    && cd wormhole \
    && chmod +x bin/*.sh \
    && sh bin/install.sh

WORKDIR /wormhole
EXPOSE 8192

ENTRYPOINT [ "bin/image.sh" ]