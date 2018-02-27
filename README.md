整理docker文档，统一开发、测试、生产环境。

# centos:base
```bash
docker build -t centos:base docker/centos\:base/
```

# mariadb:base
```bash
docker build -t mariadb:base docker/mariadb\:base/

# 默认volume
docker run -d -p 3306:3306 \
    --privileged=true \
    --restart=always \
    --name=mariadb mariadb:base

# 自定义volume（推荐）
docker run -d -p 3306:3306 \
    --privileged=true \
    --restart=always \
    --name=mariadb mariadb:base
mkdir -p /home/mariadb
docker cp mariadb:/etc/my.cnf.d /home/mariadb/
docker cp mariadb:/var/lib/mysql /home/mariadb/
docker cp mariadb:/var/backup /home/mariadb/
docker stop mariadb
docker rm mariadb
docker run -d -p 3306:3306 \
    --privileged=true \
    --restart=always \
    -v /home/mariadb/my.cnf.d:/etc/my.cnf.d \
    -v /home/mariadb/mysql:/var/lib/mysql \
    -v /home/mariadb/log:/var/log/mariadb \
    -v /home/mariadb/backup:/var/backup \
    --name=mariadb mariadb:base
```
> 当`/var/backup/schemas`存在时，将每小时自动备份数据库，备份的数据库由`schemas`文件指定，每个数据库名占一行。

> 自动备份时需提供`-h127.0.0.1 -uroot -proot`用户认证。

> 备份文件会被压缩为`tar.gz`文件，并且超过`7`天的备份文件会被删除。

# mongodb:base
```bash
docker build -t mongodb:base docker/mongodb\:base/

# 默认volume
docker run -d -p 27017:27017 \
    --privileged=true \
    --restart=always \
    --name=mongodb mongodb:base

# 自定义volume（推荐）
mkdir -p /home/mongodb/db
docker run -d -p 27017:27017 \
    --privileged=true \
    --restart=always \
    -v /home/mongodb:/data \
    --name=mongodb mongodb:base
```

# java:base
```bash
docker build -t java:base docker/java\:base/
```
> JDK版本号为：`OpenJDK-1.8`。

# java:tomcat
```bash
docker build -t java:tomcat docker/java\:tomcat/

# 默认volume
docker run -d -p 8080:8080 \
    --privileged=true \
    --restart=always \
    --name=tomcat java:tomcat

# 自定义volume（推荐）
docker run -d -p 8080:8080 \
    --privileged=true \
    --restart=always \
    --link=mariadb \
    --link=mongodb \
    --memory=4g \
    --memory-swappiness=0 \
    -v /home/tomcat/config:/data/config \
    -v /home/tomcat/webapps:/data/webapps \
    -v /home/tomcat/logs:/data/logs \
    --name=tomcat java:tomcat
```
> Tomcat版本号为：`8.5.28`；当返回`application/json`数据大小超过`4K`时启用`GZIP`压缩。

> 启动时会自动搜寻并执行`/data/config/*.sh`。

> `catalina.out`日志文件每天凌晨`4`点自动进行备份，超过`7`天的备份文件会被删除。

# node:base
```bash
docker build -t node:base docker/node\:base/

# 默认volume
docker run -d -p port:port \
    --privileged=true \
    --restart=always \
    --name=node node:base node index.js

# 自定义volume（推荐）
mkdir -p /home/node/config
mkdir -p /home/node/app
mkdir -p /home/node/log
docker run -d -p port:port \
    --privileged=true \
    --restart=always \
    -v /home/node/config:/data/config \
    -v /home/node/app:/data/app \
    -v /home/node/log:/data/log \
    --name=node node:base node index.js
```
> Node版本号为：`9.6.0`。

> 启动时会自动搜寻并执行`/data/config/*.sh`。

> 日志会被重定向到`/data/log/console.out`。

> 端口号`port`根据具体场景选择。

> 指令`node index.js`根据具体场景选择，如：`npm start`、`npm run build`等。


# nginx:base
```bash
docker build -t nginx:base docker/nginx\:base/

# 默认volume
docker run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    --name=nginx nginx:base

# 自定义volume（推荐）
mkdir -p /nginx/conf.d
docker run -d -p 80:80 -p 443:443 \
    --privileged=true \
    --restart=always \
    -v /home/nginx/conf.d:/etc/nginx/conf.d \
    -v /home/nginx/log:/var/log/nginx \
    --name=nginx nginx:base
```

# chrome:base
```bash
docker build -t chrome:base docker/chrome\:base/

# 默认volume
docker run -d -p 9222:9222 \
    --privileged=true \
    --restart=always \
    --name=chrome chrome:base

# 自定义volume & shm（推荐）
chmod +x /home/chrome/fonts/*
docker run -d -p 9222:9222 \
    --privileged=true \
    --restart=always \
    --shm-size=1g \
    -v /home/chrome/fonts:/root/.fonts \
    --name=chrome chrome:base
```
