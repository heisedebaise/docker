# nginx:base

## 构建
```bash
docker build -t nginx:base docker/nginx\:base/
```

## 运行
```bash
docker run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --name=nginx nginx:base
```

## 运行（推荐）
```bash
mkdir -p /nginx/conf.d
docker run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    -v /home/nginx/conf.d:/etc/nginx/conf.d \
    -v /home/nginx/log:/var/log/nginx \
    --name=nginx nginx:base
```