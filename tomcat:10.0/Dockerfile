FROM java:17

COPY *.sh /

RUN apk add curl \
 && chmod +x install.sh \
 && sh install.sh \
 && rm -rf install.sh

EXPOSE 8080

CMD ["/tomcat/bin/run.sh"]
