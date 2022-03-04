# java:17

## 构建

```bash
docker build -t java:17 java\:17/

podman build -t java:17 java\:17/
```

## 运行

```bash
docker run -it \
    --privileged=true \
    --name=java \
    java:17

podman run -it \
    --privileged=true \
    --name=java \
    java:17
```