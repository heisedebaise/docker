# centos:run

## 构建
```bash
docker build -t centos:run centos\:run/

podman build -t centos:run centos\:run/
```

## 运行
```bash
docker run -d \
    --privileged=true \
    --network=local \
    --name=centos centos:run

podman run -d \
    --privileged=true \
    --pod=local \
    --name=centos centos:run
```