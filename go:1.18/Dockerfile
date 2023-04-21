FROM alpine:base

RUN apk add gcc g++ wget git \
 && wget -c https://dl.google.com/go/go1.18.2.linux-amd64.tar.gz -O - | tar -xz -C /usr/local \
 && echo 'export PATH=$PATH:/usr/local/go/bin' > /etc/profile.d/go.sh \
 && source /etc/profile \
 && go env -w GO111MODULE=auto