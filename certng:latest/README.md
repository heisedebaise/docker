# certng:latest

certbot+nginx

## 构建
```bash
docker build -t certng:latest certng\:latest/
```

## 运行
```bash
docker run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --name=nginx certng:latest
```

## 运行（推荐）
```bash
docker run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --network=local \
    -v /home/nginx/conf.d:/etc/nginx/conf.d \
    -v /home/nginx/log:/var/log/nginx \
    -v /home/nginx/certbot:/etc/letsencrypt \
    --name=nginx certng:latest
```

## 新证书

```
docker exec -it nginx certbot run --nginx --register-unsafely-without-email -d {domain name}
```

## conf

```
server {
    listen 80;
    server_name {name};

    error_page 404 /;

    location / {
        root /certbot/to-https/;
    }
}

server {
    listen 443 ssl;
    server_name {name};

    ssl                  on;
    ssl_certificate      /etc/letsencrypt/live/{name}/fullchain.pem;
    ssl_certificate_key  /etc/letsencrypt/live/{name}/privkey.pem;
    ssl_session_timeout  5m;
    ssl_protocols  TLSv1.2 TLSv1.3;
    ssl_ciphers  HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers   on;

    client_max_body_size 64m;

    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header x-forwarded-for $proxy_add_x_forwarded_for;

    location / {
        proxy_pass http://{tomcat}:8080;
    }
}
```