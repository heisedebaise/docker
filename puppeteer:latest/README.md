# puppeteer:latest

构建Chrome Headless + Puppeteer服务。

## 构建
```bash
docker build -t puppeteer:latest puppeteer\:latest/
```

## 运行
```bash
docker run -d \
    --privileged=true \
    --restart=always \
    --shm-size=1g \
    -v /home/puppeteer/fonts:/root/.fonts \
    -v /home/puppeteer/service:/puppeteer/service \
    -v /home/puppeteer/logs:/puppeteer/logs \
    --name=puppeteer \
    puppeteer:latest
```