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
cp maven\:latest/settings.xml /home/maven/.m2/

mkdir -p $HOME/maven/.m2
podman run -d \
    --privileged=true \
    --pod=local \
    -v $HOME/maven/.m2:/root/.m2 \
    -v $HOME/work:/work \
    --name=maven \
    maven:latest \
    sleep 1d
cp maven\:latest/settings.xml $HOME/maven/.m2/
```

```
```

## 编译

```
docker exec maven mvn -f /work/photon clean install

podman exec maven mvn -f /work/photon clean install
```
