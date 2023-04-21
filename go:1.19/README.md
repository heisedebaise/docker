# go:1.19

## 构建

```bash
docker build -t go:1.19 go\:1.19/

podman build -t go:1.19 go\:1.19/
```

## 运行

```bash
docker run -it --rm \
    --privileged=true \
    --name=go \
    go:1.19

podman run -it --rm \
    --privileged=true \
    --name=go \
    go:1.19
```