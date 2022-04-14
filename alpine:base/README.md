# alpine:base

构建基于Alpine基础Docker包。

## 构建
```bash
docker build -t alpine:base alpine\:base/

podman build -t alpine:base alpine\:base/
```

## 运行
```bash
docker run -it --rm \
    --privileged=true \
    --network=local \
    --name=alpine \
    alpine:base

podman run -it --rm \
    --privileged=true \
    --pod=local \
    --name=alpine \
    alpine:base
```