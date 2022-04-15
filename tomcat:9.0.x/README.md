# tomcat:9.0.x

构建基于`Tomcat-9.0.x`的Tomcat服务。
- 当返回`application/json`数据大小超过`4K`时启用`GZIP`压缩。
- `catalina.out`日志文件每天`00:00:00`点自动进行备份，超过`7`天的备份文件会被删除。

## 构建
```bash
docker build -t tomcat:9.0.x tomcat\:9.0.x/

podman build -t tomcat:9.0.x tomcat\:9.0.x/
```

## 运行
```bash
docker run -d -p 8080:8080 \
    --privileged=true \
    --restart=always \
    --name=tomcat \
    tomcat:9.0.x

podman run -d -p 8080:8080 \
    --privileged=true \
    --name=tomcat \
    tomcat:9.0.x
```

## 运行（推荐）
```bash
docker run -d \
    --privileged=true \
    --restart=always \
    --memory-swappiness=0 \
    --network=local \
    -v /home/tomcat/webapps:/tomcat/webapps \
    -v /home/tomcat/logs:/tomcat/logs \
    --name=tomcat \
    tomcat:9.0.x

mkdir -p /home/tomcat/config
mkdir -p /home/tomcat/webapps
mkdir -p /home/tomcat/logs
podman run -d \
    --privileged=true \
    --memory-swappiness=0 \
    --pod=local \
    -v /home/tomcat/webapps:/tomcat/webapps \
    -v /home/tomcat/logs:/tomcat/logs \
    --name=tomcat \
    tomcat:9.0.x

mkdir -p $HOME/tomcat/webapps
mkdir -p $HOME/tomcat/logs
podman run -d \
    --privileged=true \
    --pod=local \
    -v $HOME/tomcat/webapps:/tomcat/webapps \
    -v $HOME/tomcat/logs:/tomcat/logs \
    --name=tomcat \
    tomcat:9.0.x
```

> 建议设置Tomcat启动时的`-Xms`&`-Xmx`参数值，默认最大内存通常只有总内存的`1/4`；可通过`java -XX:+PrintFlagsFinal -version | grep -iE 'HeapSize|PermSize|ThreadStackSize'`查看默认内存配置值。
