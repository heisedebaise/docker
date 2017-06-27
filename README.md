整理docker文档，统一开发、测试、生产环境。

# java-base
```bash
docker build -t java:base docker/java\:base/
```

# java-tomcat
```bash
docker build -t java:tomcat docker/java\:tomcat/

# 默认volume
docker run -d -p 8080:8080 \
    --privileged=true \
    --name tomcat java:tomcat
# 自定义volume（推荐）
docker run -d -p 8080:8080 \
    --privileged=true \
    -v /data/config:/data/config \
    -v /data/webapps:/data/webapps \
    -v /data/logs:/data/logs \
    --name tomcat java:tomcat
```
> java:tomcat在启动时会自动搜寻并执行`/data/config/*.sh`。

# java-maven
```bash
docker build -t java:maven docker/java\:maven/
```
