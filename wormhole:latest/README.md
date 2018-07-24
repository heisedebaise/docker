# wormhole:latest

构建`wormhole`服务。

## 构建
```bash
docker build -t wormhole:latest docker/wormhole\:latest/
```

## 运行
```bash
docker run -d -p 2048:2048 -p 8192:8192 -p 8443:8443 \
    --privileged=true \
    --restart=always \
    --name=wormhole wormhole:latest
```

## 运行（推荐）
```bash
docker run -d -p 2048:2048 -p 8192:8192 -p 8443:8443 \
    --privileged=true \
    --restart=always \
    -v /home/wormhole/conf:/wormhole/conf \
    -v /home/wormhole/whimg:/wormhole/whimg \
    -v /home/wormhole/whfile:/wormhole/whfile \
    -v /home/wormhole/logs:/wormhole/logs \
    --name=wormhole wormhole:latest
```