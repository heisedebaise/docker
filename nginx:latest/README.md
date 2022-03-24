# nginx:latest

## 构建
```bash
docker build -t nginx:latest nginx\:latest/
```

## 运行
```bash
docker run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --network=local \
    --name=nginx \
    nginx:latest
```

## 运行（推荐）
```bash
docker run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --network=local \
    -v /home/nginx/conf.d:/etc/nginx/conf.d \
    --name=nginx \
    nginx:latest
```