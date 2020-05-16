# puppeteer:base

构建Chrome Headless服务。

## 构建
```bash
docker build -t puppeteer:base puppeteer\:base/

podman build -t puppeteer:base puppeteer\:base/
```

## 运行
```bash
docker run -it \
    --privileged=true \
    --name=puppeteer puppeteer:base

podman run -it \
    --privileged=true \
    --name=puppeteer puppeteer:base
```

## 运行（推荐）
```bash
mkdir -p /home/puppeteer/fonts/
chmod +x /home/puppeteer/fonts/*
docker run -it \
    --privileged=true \
    --shm-size=1g \
    -v /home/puppeteer/fonts:/root/.fonts \
    --name=puppeteer puppeteer:base

mkdir -p $HOME/puppeteer/fonts/
chmod +x $HOME/puppeteer/fonts/*
podman run -it \
    --privileged=true \
    --shm-size=1g \
    --pod=local \
    -v $HOME/puppeteer/fonts:/root/.fonts \
    --name=puppeteer puppeteer:base
```