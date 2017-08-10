整理docker文档，统一开发、测试、生产环境。

# centos:base
```base
docker build -t centos:base docker/centos\:base/
```

# java:base
```bash
docker build -t java:base docker/java\:base/
```

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
    -v /tomcat/config:/data/config \
    -v /tomcat/webapps:/data/webapps \
    -v /tomcat/logs:/data/logs \
    --name=tomcat java:tomcat
```
> java:tomcat在启动时会自动搜寻并执行`/data/config/*.sh`。

# java:maven
```bash
docker build -t java:maven docker/java\:maven/
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
rm -rf /mariadb
mkdir -p /mariadb/log
docker run -d -p 3306:3306 \
    --privileged=true \
    --restart=always \
    --name=mariadb mariadb:base
docker cp mariadb:/var/lib/mysql /mariadb/
docker cp mariadb:/etc/my.cnf.d /mariadb/
docker stop mariadb
docker rm mariadb
docker run -d -p 3306:3306 \
    --privileged=true \
    --restart=always \
    -v /mariadb/mysql:/var/lib/mysql \
    -v /mariadb/my.cnf.d:/etc/my.cnf.d \
    -v /mariadb/log:/var/log/mariadb \
    --name=mariadb mariadb:base
```

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

# nginx:base
```bash
docker build -t nginx:base docker/nginx\:base/

# 默认volume
docker run -d -p 80:80 -p 443:443 \
    --restart=always \
    --name=nginx nginx:base

# 自定义volume（推荐）
docker run -d -p 80:80 -p 443:443 \
    --restart=always \
    -v /nginx/conf.d:/etc/nginx/conf.d \
    -v /nginx/log:/var/log/nginx \
    -v /nginx/data:/usr/share/nginx/html \
    --name=nginx nginx:base
```
