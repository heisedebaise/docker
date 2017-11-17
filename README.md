整理docker文档，统一开发、测试、生产环境。

# centos:base
```base
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
mkdir -p /mariadb
docker run -d -p 3306:3306 \
    --privileged=true \
    --restart=always \
    --name=mariadb mariadb:base
docker cp mariadb:/etc/my.cnf.d /mariadb/
docker cp mariadb:/var/lib/mysql /mariadb/
docker cp mariadb:/var/backup /mariadb/
docker stop mariadb
docker rm mariadb
docker run -d -p 3306:3306 \
    --privileged=true \
    --restart=always \
    -v /mariadb/my.cnf.d:/etc/my.cnf.d \
    -v /mariadb/mysql:/var/lib/mysql \
    -v /mariadb/log:/var/log/mariadb \
    -v /mariadb/backup:/var/backup \
    --name=mariadb mariadb:base
```
> 当`/backup/schemas`存在时，将每小时自动备份数据库，备份的数据库由`schemas`文件指定，每个数据库名占一行。

> 自动备份时需提供`-h127.0.0.1 -uroot -proot`用户认证。

> 备份文件会被压缩为`tar.gz`文件，并且超过30天的备份文件会被删除。

# mongodb:base
```bash
docker build -t mongodb:base docker/mongodb\:base/

# 默认volume
docker run -d -p 27017:27017 \
    --privileged=true \
    --restart=always \
    --name=mongodb mongodb:base

# 自定义volume（推荐）
mkdir -p /mongodb/db
docker run -d -p 27017:27017 \
    --privileged=true \
    --restart=always \
    -v /mongodb:/data \
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
    -v /tomcat/config:/data/config \
    -v /tomcat/webapps:/data/webapps \
    -v /tomcat/logs:/data/logs \
    --name=tomcat java:tomcat
```
> Tomcat版本号为：`8.5.23`；当返回`application/json`数据大小超过`4K`时启用`GZIP`压缩。

> 启动时会自动搜寻并执行`/data/config/*.sh`。

# node:base
```bash
docker build -t node:base docker/node\:base/

# 默认volume
docker run -d -p port:port \
    --privileged=true \
    --restart=always \
    --name=node node:base node index.js

# 自定义volume（推荐）
mkdir -p /node/config
mkdir -p /node/app
mkdir -p /node/log
docker run -d -p port:port \
    --privileged=true \
    --restart=always \
    -v /node/config:/data/config \
    -v /node/app:/data/app \
    -v /node/log:/data/log \
    --name=node node:base node index.js
```
> Node版本号为：`8.4.0`。

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
    -v /nginx/conf.d:/etc/nginx/conf.d \
    -v /nginx/log:/var/log/nginx \
    --name=nginx nginx:base
```
