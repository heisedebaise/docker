# nodejs:14

构建NodeJS，版本号14。

## 构建
```bash
docker build -t nodejs:14 nodejs\:14/

podman build -t nodejs:14 nodejs\:14/
```

## 运行
```bash
docker run -it \
    --privileged=true \
    --name=nodejs \
    nodejs:14

podman run -it \
    --privileged=true \
    --name=nodejs \
    nodejs:14
```

## 运行（推荐）
```bash
docker run -it \
    --privileged=true \
    --network=local \
    --name=nodejs \
    nodejs:14

podman run -it \
    --privileged=true \
    --pod=local \
    --name=nodejs \
    nodejs:14
```