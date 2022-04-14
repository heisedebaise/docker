# go:1.18

## 构建

```bash
docker build -t go:1.18 go\:1.18/

podman build -t go:1.18 go\:1.18/
```

## 运行

```bash
docker run -d \
    --privileged=true \
    --name=go \
    go:1.18 \
    sleep 1d

podman run -d \
    --privileged=true \
    --name=go \
    go:1.18 \
    sleep 1d
```