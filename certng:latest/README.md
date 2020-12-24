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
    --name=nginx certng:latest

podman run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --name=nginx certng:latest
```

## 运行（推荐）

```
docker run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --network=local \
    -v /home/nginx/conf.d:/etc/nginx/conf.d \
    -v /home/nginx/log:/var/log/nginx \
    -v /home/nginx/certbot:/etc/letsencrypt \
    --name=nginx certng:latest

mkdir -p /home/nginx/conf.d
mkdir -p /home/nginx/log
mkdir -p /home/nginx/certbot
podman run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --network=local \
    -v /home/nginx/conf.d:/etc/nginx/conf.d \
    -v /home/nginx/log:/var/log/nginx \
    -v /home/nginx/certbot:/etc/letsencrypt \
    --name=nginx certng:latest

mkdir -p $HOME/nginx/conf.d
mkdir -p $HOME/nginx/log
mkdir -p $HOME/nginx/certbot
podman run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --network=local \
    -v $HOME/nginx/conf.d:/etc/nginx/conf.d \
    -v $HOME/nginx/log:/var/log/nginx \
    -v $HOME/nginx/certbot:/etc/letsencrypt \
    --name=nginx certng:latest
```

## 更新配置

```
docker exec -it nginx nginx -t
docker exec -it nginx nginx -s reload
```

## 新证书

```
docker exec -it nginx certbot run --nginx --register-unsafely-without-email -d {domain name}
```

## 删除证书

```
docker exec -it nginx certbot delete
```

## 强制HTTPS

```
server {
    listen 80;
    server_name {name};

    location / {
        root /certbot/to-https/;
    }
}
```