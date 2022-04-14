FROM alpine:base

COPY go1.18.1.linux-amd64.tar.gz /

RUN apk add gcc g++ git \
 && tar -zxf /go1.18.1.linux-amd64.tar.gz -C /usr/local \
 && rm -rf /go1.18.1.linux-amd64.tar.gz \
 && echo 'export PATH=$PATH:/usr/local/go/bin:/root/go/bin' > /etc/profile.d/go.sh \
 && source /etc/profile \
 && go env -w GO111MODULE=auto