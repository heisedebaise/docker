# spring boot

> `/springboot/logs/out`日志文件每天`00:00:00`点自动进行备份，超过`7`天的备份文件会被删除。

## 构建
```bash
docker build -t springboot:latest springboot\:latest/
```

## 运行（推荐）
```bash
docker run -d \
    --privileged=true \
    --restart=always \
    --network=local \
    -v /home/springboot:/springboot \
    --name=springboot \
    springboot:latest
```
