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
    --name=java \
    java:latest

podman run -it \
    --privileged=true \
    --name=java \
    java:latest
```

## install

```
#!/bin/bash

version=17
dnf install -y java-$version-openjdk-devel
rm -f /etc/alternatives/java
rm -f /etc/alternatives/javac
ln -s /usr/lib/jvm/java-$version/bin/java /etc/alternatives/
ln -s /usr/lib/jvm/java-$version/bin/javac /etc/alternatives/
rm -rf /usr/lib/jvm/java
ln -s /etc/alternatives/java_sdk_$version /usr/lib/jvm/java

java -version
javac -version
```