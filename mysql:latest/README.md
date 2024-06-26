# mysql official latest

## 运行

```bash
docker run -d \
    --privileged=true \
    --restart=always \
    --network=local \
    -e MYSQL_ROOT_PASSWORD=root \
    -e MYSQL_DATABASE={schema name} \
    -v /home/mysql/lib:/var/lib/mysql \
    --name=mysql \
    mysql:latest

rm -rf $HOME/mysql
mkdir -p $HOME/mysql/lib
podman run -d \
    --privileged=true \
    -e MYSQL_ROOT_PASSWORD=root \
    -e MYSQL_DATABASE={schema name} \
    -v $HOME/mysql/lib:/var/lib/mysql \
    --pod=local \
    --name=mysql \
    mysql:latest
```

```
# ERROR 2061 (HY000): Authentication plugin 'caching_sha2_password' reported error: Authentication requires secure connection.
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
FLUSH PRIVILEGES;
```

```
echo "alias mysql='docker exec -it mysql mysql --default-character-set=utf8 -uroot -p'" >> /etc/profile.d/alias.sh
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