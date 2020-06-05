# certng:latest

certbot+nginx

## 构建
```bash
docker build -t certng:latest certng\:latest/
```

## 运行
```bash
docker run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --name=nginx certng:latest
```

## 运行（推荐）
```bash
docker run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    -v /home/nginx/conf.d:/etc/nginx/conf.d \
    -v /home/nginx/log:/var/log/nginx \
    -v /home/nginx/certbot:/etc/letsencrypt \
    --name=nginx certng:latest
```

## 新证书

```
docker exec -it nginx certbot run --nginx --register-unsafely-without-email -d {domain name}
```