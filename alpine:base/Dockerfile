FROM docker.io/library/alpine

COPY sgerrand.rsa.pub /etc/apk/keys/
COPY *.apk /

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
 && apk update \
 && apk upgrade \
 && apk add --force-overwrite glibc-2.35-r1.apk glibc-bin-2.35-r1.apk glibc-i18n-2.35-r1.apk \
 && rm -rf glibc-*.apk \
 && rm -rf /etc/apk/keys/sgerrand.rsa.pub \
 && /usr/glibc-compat/bin/localedef -i zh_CN -f UTF-8 zh_CN.UTF-8 \
 && apk add tzdata fontconfig \
 && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
 && ln -s /usr/lib/libfontconfig.so.1 /usr/lib/libfontconfig.so \
 && ln -s /lib/libuuid.so.1 /usr/lib/libuuid.so.1 \
 && ln -s /lib/libc.musl-x86_64.so.1 /usr/lib/libc.musl-x86_64.so.1
