# chrome:latest

构建Chrome Headless服务。

## 构建
```bash
docker build -t chrome:latest chrome\:latest/

podman build -t chrome:latest chrome\:latest/
```

## 运行
```bash
docker run -d -p 9222:9222 \
    --privileged=true \
    --restart=always \
    --name=chrome chrome:latest
```

## 运行（推荐）
```bash
mkdir -p /home/chrome/fonts/
chmod +x /home/chrome/fonts/*
docker run -d -p 9222:9222 \
    --privileged=true \
    --restart=always \
    --shm-size=1g \
    -v /home/chrome/fonts:/root/.fonts \
    --name=chrome chrome:latest
```
