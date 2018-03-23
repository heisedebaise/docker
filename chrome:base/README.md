# chrome:base

构建Chrome Headless服务。

## 构建
```bash
docker build -t chrome:base docker/chrome\:base/
```

## 运行
```bash
docker run -d -p 9222:9222 \
    --privileged=true \
    --restart=always \
    --name=chrome chrome:base
```

## 运行（推荐）
```bash
chmod +x /home/chrome/fonts/*
docker run -d -p 9222:9222 \
    --privileged=true \
    --restart=always \
    --shm-size=1g \
    -v /home/chrome/fonts:/root/.fonts \
    --name=chrome chrome:base
```
