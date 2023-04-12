# java:base

构建基于`OpenJDK-1.8`的Java环境。

## 构建
```bash
docker build -t java:1.8 java\:1.8/
```

## run

```
docker run -d \
    -p 8080:8080 \
    --privileged=true \
    --restart=always \
    --network=local \
    -v /home/maven/work/hospital:/hospital \
    --name=hospital \
    java:1.8 \
    sh /hospital/run.sh
```