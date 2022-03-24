# maven:latest

## 构建

```bash
docker build -t maven:latest maven\:latest/

podman build -t maven:latest maven\:latest/
```

## 运行

```bash
docker run -d \
    --privileged=true \
    --name=maven \
    maven:latest \
    sleep 1024d

podman run -d \
    --privileged=true \
    --name=maven \
    maven:latest \
    sleep 1024d
```

## 运行（推荐）

```bash
docker run -d \
    --privileged=true \
    -v /home/maven/.m2:/root/.m2 \
    -v /home/maven/work:/work \
    --name=maven \
    maven:latest \
    sleep 1024d

mkdir -p /home/maven/.m2
mkdir -p /home/maven/work
podman run -d \
    --privileged=true \
    -v /home/maven/.m2:/root/.m2 \
    -v /home/maven/work:/work \
    --name=maven \
    maven:latest \
    sleep 1024d

mkdir -p $HOME/maven/.m2
mkdir -p $HOME/maven/work
podman run -d \
    --privileged=true \
    -v $HOME/maven/.m2:/root/.m2 \
    -v $HOME/maven/work:/work \
    --name=maven \
    maven:latest \
    sleep 1024d
```

## 编译

```
docker exec maven mvn -f /work/photon clean
docker exec maven mvn -f /work/photon install

podman exec maven mvn -f /work/photon clean
podman exec maven mvn -f /work/photon install
```
