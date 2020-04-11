FROM go:base

RUN yum install -y git \
    && git clone https://github.com/heisedebaise/wormhole.git \
    && cd wormhole \
    && chmod +x bin/*.sh \
    && sh bin/install.sh

WORKDIR /wormhole

EXPOSE 2048
EXPOSE 8192
EXPOSE 8443

ENTRYPOINT [ "bin/run.sh" ]