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
    --name tomcat java:tomcat
# 自定义volume（推荐）
docker run -d -p 8080:8080 \
    --privileged=true \
    --restart=always \
    -v /tomcat/config:/data/config \
    -v /tomcat/webapps:/data/webapps \
    -v /tomcat/logs:/data/logs \
    --name tomcat java:tomcat
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
    --restart=always \
    --name mariadb mariadb:base
# 自定义volume（推荐）
docker run -d -p 3306:3306 \
    --restart=always \
    -v /mariadb/data:/var/lib/mysql \
    -v /mariadb/log:/var/log/mariadb \
    --name mariadb mariadb:base
```
