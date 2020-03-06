# certbot:base

## 构建
```bash
docker build -t certbot:base docker/certbot\:base/
```

## 运行
```bash
docker run -it \
    --privileged=true \
    --restart=always \
    --name=certbot certbot:base
```