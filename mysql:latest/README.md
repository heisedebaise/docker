# mysql official latest

## 运行

```bash
docker run -d \
    --privileged=true \
    --restart=always \
    -e MYSQL_ROOT_PASSWORD=root \
    --name=mysql \
    mysql:latest
sleep 10s
rm -rf /home/mysql
mkdir -p /home/mysql
docker cp mysql:/etc/mysql /home/mysql/etc
docker cp mysql:/var/lib/mysql /home/mysql/lib
docker stop -t 1 mysql
docker rm mysql
docker run -d \
    --privileged=true \
    --restart=always \
    --network=local \
    -v /home/mysql/etc:/etc/mysql \
    -v /home/mysql/lib:/var/lib/mysql \
    --name=mysql \
    mysql:latest

podman run -d \
    --privileged=true \
    -e MYSQL_ROOT_PASSWORD=root \
    --name=mysql \
    mysql:latest
sleep 10s
mkdir -p /home/mysql/backup
podman cp mysql:/etc/mysql /home/mysql/etc
podman cp mysql:/var/lib/mysql /home/mysql/lib
podman stop -t 1 mysql
podman rm mysql
podman run -d \
    --privileged=true \
    --pod=local \
    -v /home/mysql/etc:/etc/mysql \
    -v /home/mysql/lib:/var/lib/mysql \
    --name=mysql \
    mysql:latest

podman run -d \
    --privileged=true \
    -e MYSQL_ROOT_PASSWORD=root \
    --pod=local \
    --name=mysql \
    mysql:latest
sleep 10s
rm -rf $HOME/mysql
mkdir -p $HOME/mysql
podman cp mysql:/etc/mysql $HOME/mysql/etc
podman cp mysql:/var/lib/mysql $HOME/mysql/lib
podman stop -t 1 mysql
podman rm mysql
podman run -d \
    --privileged=true \
    --pod=local \
    -v $HOME/mysql/etc:/etc/mysql \
    -v $HOME/mysql/lib:/var/lib/mysql \
    --name=mysql \
    mysql:latest
```

```
# ERROR 2061 (HY000): Authentication plugin 'caching_sha2_password' reported error: Authentication requires secure connection.
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
FLUSH PRIVILEGES;
```

```
echo "alias mysql='docker exec -it mysql mysql -uroot -proot'" >> /etc/profile.d/alias.sh
```

# backup

```
#!/bin/bash

cd /etc/mysql/backup
for schema in mysql
do
  mysqldump -uroot -proot $schema > $schema.sql
done

name=`date +"%Y%m%d%H%M%S"`
tar -czf $name.tar.gz *.sql
rm -rf *.sql
find . -name '*.tar.gz' -mtime +30 -exec rm -rf {} \;
```

```
docker exec mysql sh /etc/mysql/backup/run.sh
```

# binlog

```
show variables like '%logs%';

set global binlog_expire_logs_seconds=7*24*3600;

PURGE MASTER LOGS TO 'binlog.000001';
```