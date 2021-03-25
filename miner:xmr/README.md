# miner:xmr

## 构建
```
docker build -t miner:xmr miner\:xmr/

podman build -t miner:xmr miner\:xmr/
```

## 运行

```
docker run -d \
    --privileged=true \
    --restart=always \
    --cpus=1 \
    --memory=1g \
    --name=xmr miner:xmr

podman run -d \
    --privileged=true \
    --name=xmr miner:xmr
```