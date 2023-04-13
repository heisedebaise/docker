# java:base

构建基于`OpenJDK-1.8`的Java环境。

## 构建
```bash
docker build -t java:1.8 java\:1.8/
```

## 运行
```
docker run -it --rm \
    --privileged=true \
    --name=java \
    java:1.8 bash
```