FROM docker.io/library/alpine

COPY sgerrand.rsa.pub /etc/apk/keys/
COPY *.apk /

RUN apk update \
 && apk upgrade \
 && apk add glibc-2.34-r0.apk glibc-bin-2.34-r0.apk glibc-i18n-2.34-r0.apk \
 && rm -rf glibc-*.apk \
 && rm -rf /etc/apk/keys/sgerrand.rsa.pub

RUN /usr/glibc-compat/bin/localedef -i zh_CN -f UTF-8 zh_CN.UTF-8 \
 && apk add tzdata \
 && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
