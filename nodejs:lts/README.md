# nodejs:lts

构建NodeJS LTS。

## 构建
```bash
docker build -t nodejs:lts nodejs\:lts/

podman build -t nodejs:lts nodejs\:lts/
```

## 运行
```bash
docker run -it \
    --privileged=true \
    --name=nodejs \
    nodejs:lts

podman run -it \
    --privileged=true \
    --name=nodejs \
    nodejs:lts
```

## 运行（推荐）
```bash
docker run -d \
    --privileged=true \
    --network=local \
    --name=nodejs \
    nodejs:lts

podman run -it \
    --privileged=true \
    --pod=local \
    --name=nodejs \
    nodejs:lts
```

## puppeteer

```
docker exec -it nodejs dnf install -y nss atk at-spi2-atk cups libdrm libXcomposite libXdamage mesa-libgbm pango alsa-lib libxshmfence
```