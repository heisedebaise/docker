# certbot:base

## 构建
```bash
docker build -t certbot:base docker/certbot\:base/
```

## 运行
```bash
docker run -d -p 80:80/tcp -p 443:443/tcp \
    --privileged=true \
    --restart=always \
    -v /home/cert:/certbot/cert \
    --name=certbot certbot:base
```

## 新证书

```
docker exec -it certbot certbot-2 certonly --standalone --register-unsafely-without-email -d {domain}
```

## 取消监听端口

```
docker rmi certbot:port
docker stop certbot
docker commit certbot certbot:port
docker rm certbot
docker run -d \
    --privileged=true \
    --restart=always \
    -v /home/cert:/certbot/cert \
    --name=certbot certbot:port
```

## 映射监听端口

```
docker rmi certbot:noport
docker stop certbot
docker commit certbot certbot:noport
docker rm certbot
docker run -d -p 80:80/tcp -p 443:443/tcp \
    --privileged=true \
    --restart=always \
    -v /home/cert:/certbot/cert \
    --name=certbot certbot:noport
```