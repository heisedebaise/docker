# java:latest

构建基于`OpenJDK`的Java环境。

## 构建

```bash
docker build -t java:latest java\:latest/

podman build -t java:latest java\:latest/
```

## 运行

```bash
docker run -it \
    --privileged=true \
    --name=java java:latest

podman run -it \
    --privileged=true \
    --name=java java:latest
```