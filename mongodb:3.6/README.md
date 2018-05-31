# mongodb:3.6

构建基于`mongodb-org`的MongoDB服务，版本号为：3.6。

## 构建
```bash
docker build -t mongodb:3.6 docker/mongodb\:3.6/
```

## 运行
```bash
docker run -d -p 27017:27017 \
    --privileged=true \
    --restart=always \
    --name=mongodb mongodb:3.6
```

## 运行（推荐）
```bash
mkdir -p /home/mongodb/db
mkdir -p /home/mongodb/log
docker run -d -p 27017:27017 \
    --privileged=true \
    --restart=always \
    -v /home/mongodb/db:/data/db \
    -v /home/mongodb/log:/var/log/mongodb \
    --name=mongodb mongodb:3.6
```
