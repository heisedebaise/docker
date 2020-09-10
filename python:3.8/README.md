# python:3.8

## 构建
```bash
docker build -t python:3.8 python\:3.8/

podman build -t python:3.8 python\:3.8/
```

## 运行
```bash
docker run -it \
    --privileged=true \
    --name=python python:3.8

podman run -it \
    --privileged=true \
    --name=python python:3.8
```