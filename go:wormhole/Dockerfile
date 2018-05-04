FROM go:base

RUN yum install -y git \
    && git clone https://github.com/heisedebaise/wormhole.git \
    && cd wormhole \
    && chmod +x bin/*.sh \
    && sh bin/install.sh

WORKDIR /wormhole

VOLUME [ "/wormhole/conf", "/wormhole/whimg" ]

EXPOSE 8192

ENTRYPOINT [ "bin/run.sh" ]