# centos:base

构建基于CentOS基础Docker包。

## 构建
```bash
docker build -t centos:base centos\:base/

podman build -t centos:base centos\:base/
```

## 运行
```bash
docker run -it \
    --privileged=true \
    --network=local \
    --name=centos \
    centos:base

podman run -it \
    --privileged=true \
    --pod=local \
    --name=centos \
    centos:base
```