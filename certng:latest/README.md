# certng:latest

certbot+nginx

## 构建
```
docker build -t certng:latest certng\:latest/

podman build -t certng:latest certng\:latest/
```

## 运行

```
docker run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --name=certng \
    certng:latest

podman run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --name=certng \
    certng:latest
```

## 运行（推荐）

```
docker run -d \
    -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --network=local \
    -v /home/nginx/http.d:/etc/nginx/http.d \
    -v /home/nginx/log:/var/log/nginx \
    -v /home/certbot/letsencrypt:/etc/letsencrypt \
    -v /home/certbot/log:/var/log/certbot \
    --name=certng \
    certng:latest

mkdir -p /home/nginx/conf.d
mkdir -p /home/nginx/log
mkdir -p /home/nginx/certbot
podman run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --pod=local \
    -v /home/nginx/conf.d:/etc/nginx/conf.d \
    -v /home/nginx/log:/var/log/nginx \
    -v /home/nginx/certbot:/etc/letsencrypt \
    --name=certng \
    certng:latest

mkdir -p $HOME/nginx/conf.d
mkdir -p $HOME/nginx/log
mkdir -p $HOME/nginx/certbot
podman run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --pod=local \
    -v $HOME/nginx/conf.d:/etc/nginx/conf.d \
    -v $HOME/nginx/log:/var/log/nginx \
    -v $HOME/nginx/certbot:/etc/letsencrypt \
    --name=certng \
    certng:latest
```

## 更新配置

```
docker exec -it certng nginx -t
docker exec -it certng nginx -s reload
```

## 新证书

```
docker exec -it certng certbot --nginx --register-unsafely-without-email -d {domain name}
```

## 删除证书

```
docker exec -it certng certbot delete
```

## conf.d/{domain name}.conf

```
server {
    listen 80;
    server_name {domain name};

    error_page 404 /;

    location / {
        root /certng/http/;
    }
}

server {
    listen 443 ssl;
    server_name {domain name};

    ssl_certificate      /etc/letsencrypt/live/{domain name}/fullchain.pem;
    ssl_certificate_key  /etc/letsencrypt/live/{domain name}/privkey.pem;
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