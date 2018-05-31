# mariadb:latest

构建基于`MariaDB`的MySQL服务。
- 当`/var/backup/schemas`存在时，将每小时自动备份数据库，备份的数据库由`schemas`文件指定，每个数据库名占一行。
- 自动备份时需提供`-h127.0.0.1 -uroot -proot`用户认证。
- 备份文件会被压缩为`tar.gz`文件，并且超过`7`天的备份文件会被删除。

## 构建
```bash
docker build -t mariadb:latest docker/mariadb\:latest/
```

## 运行
```bash
docker run -d -p 3306:3306 \
    --privileged=true \
    --restart=always \
    --name=mariadb mariadb:latest
```

## 运行（推荐）
```bash
docker run -d -p 3306:3306 \
    --privileged=true \
    --restart=always \
    --name=mariadb mariadb:latest
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
    --name=mariadb mariadb:latest
```
