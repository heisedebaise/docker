# certbot:base

## 构建
```bash
docker build -t certbot:base docker/certbot\:base/
```

## 运行
```bash
docker run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --name=certbot certbot:base
```