# go:1.18

## 构建

```bash
cp /mnt/hgfs/share/soft/go1.18.1.linux-amd64.tar.gz go\:1.18/

docker build -t go:1.18 go\:1.18/

podman build -t go:1.18 go\:1.18/

rm -rf go\:1.18/go1.18.1.linux-amd64.tar.gz
```

## 运行

```bash
docker run -it --rm \
    --privileged=true \
    --name=go \
    go:1.18

podman run -it --rm \
    --privileged=true \
    --name=go \
    go:1.18
```