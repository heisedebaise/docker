# java:tomcat

构建基于`Tomcat-8.5`的Tomcat服务。
- Tomcat版本号为`8.5.46，基于`java:1.8`。
- 当返回`application/json`数据大小超过`4K`时启用`GZIP`压缩。
- 启动时会自动搜寻并执行`/data/config/*.sh`。
- `catalina.out`日志文件每天凌晨`4`点自动进行备份，超过`7`天的备份文件会被删除。

## 构建
```bash
docker build -t tomcat:8.5 tomcat\:8.5/
```

## 运行
```bash
docker run -d -p 8080:8080 \
    --privileged=true \
    --restart=always \
    --name=tomcat tomcat:8.5
```

## 运行（推荐）
```bash
docker run -d -p 8080:8080 \
    --privileged=true \
    --restart=always \
    --memory=4g \
    --memory-swappiness=0 \
    -v /home/tomcat/config:/data/config \
    -v /home/tomcat/webapps:/data/webapps \
    -v /home/tomcat/logs:/data/logs \
    --name=tomcat tomcat:8.5
```
> 建议设置Tomcat启动时的`-Xms`&`-Xmx`参数值，默认最大内存通常只有总内存的`1/4`；可通过`java -XX:+PrintFlagsFinal -version | grep -iE 'HeapSize|PermSize|ThreadStackSize'`查看默认内存配置值。
