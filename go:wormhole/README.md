# go:wormhole

构建`wormhole`服务。

## 构建
```bash
docker build -t go:wormhole docker/go\:wormhole/
```

## 运行
```bash
docker run -d -p 8192:8192 \
    --privileged=true \
    --restart=always \
    --name=wormhole go:wormhole
```

## 运行
```bash
docker run -d -p 8192:8192 \
    --privileged=true \
    -v /home/wormhole/conf:/wormhole/conf \
    -v /home/wormhole/image:/wormhole/image \
    --name=wormhole go:wormhole
```