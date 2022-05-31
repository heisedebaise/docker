```
docker run -d -p 10022:22 \
    --privileged=true \
    --restart=always \
    --network=local \
    -v /home/gogs:/data \
    --name=gogs \
    gogs/gogs
```

```
docker exec -it nginx certbot --nginx --register-unsafely-without-email -d {domain name}
```

```
server {
    listen 80;
    server_name {domain name};

    error_page 404 /;

    location / {
        root /certbot/to-https/;
    }
}

server {
    listen 443 ssl;
    server_name {domain name};

    ssl                  on;
    ssl_certificate      /etc/letsencrypt/live/{domain name}/fullchain.pem;
    ssl_certificate_key  /etc/letsencrypt/live/{domain name}/privkey.pem;
    ssl_session_timeout  5m;
    ssl_protocols  TLSv1.2 TLSv1.3;
    ssl_ciphers  HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers   on;

    client_max_body_size 64m;

    location / {
        proxy_pass http://gogs:3000;
    }
}
```