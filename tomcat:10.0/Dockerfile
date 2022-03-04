FROM java:17

RUN mkdir -p /data/bin

COPY *.sh /data/bin/

RUN chmod +x /data/bin/*.sh \
 && source /data/bin/install.sh \
 && rm -rf /data/bin/install.sh

EXPOSE 8080

CMD ["/data/bin/run.sh"]
