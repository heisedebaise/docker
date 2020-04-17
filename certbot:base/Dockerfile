FROM certbot/certbot:latest

RUN mkdir -p /certbot/cert

COPY renew.sh /certbot/

RUN chmod +x /certbot/renew.sh

EXPOSE 80/tcp 443/tcp

CMD [ "/certbot/renew.sh" ]
