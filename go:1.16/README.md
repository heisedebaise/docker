# go:1.16

## 构建

```bash
docker build -t go:1.16 go\:1.16/

podman build -t go:1.16 go\:1.16/
```

## 运行

```bash
docker run -d \
    --privileged=true \
    --name=go \
    go:1.16

podman run -d \
    --privileged=true \
    --name=go \
    go:1.16
```

## 运行（推荐）

```bash
docker run -d \
    --privileged=true \
    -v /home/go/work:/data/work \
    --name=go \
    go:1.16

mkdir -p /home/go/work
podman run -d \
    --privileged=true \
    -v /home/go/work:/data/work \
    --name=go \
    go:1.16

mkdir -p $HOME/go/work
podman run -d \
    --privileged=true \
    -v $HOME/go/work:/data/work \
    --name=go \
    go:1.16
```

## 编译

```
docker exec go mvn -f /data/work/photon clean
docker exec go mvn -f /data/work/photon install

podman exec go mvn -f /data/work/photon clean
podman exec go mvn -f /data/work/photon install
```
