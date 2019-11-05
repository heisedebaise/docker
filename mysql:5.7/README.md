# mysql:5.7

构建基于`mysql-community`的MySQL服务，版本号为：5.7。
- 当`/var/backup/schemas`存在时，将每小时自动备份数据库，备份的数据库由`schemas`文件指定，每个数据库名占一行。
- 自动备份时需提供`-h127.0.0.1 -uroot -proot`用户认证。
- 备份文件会被压缩为`tar.gz`文件，并且超过`7`天的备份文件会被删除。

## 构建
```bash
docker build -t mysql:5.7 docker/mysql\:5.7/
```

## 运行
```bash
docker run -d -p 3306:3306 \
    --privileged=true \
    --restart=always \
    --name=mysql mysql:5.7
```

## 运行（推荐）
```bash
docker run -d -p 3307:3306 \
    --privileged=true \
    --restart=always \
    --name=mysql5 mysql:5.7
mkdir -p /home/mysql5
docker cp mysql5:/etc/my.cnf.d /home/mysql5/
docker cp mysql5:/var/lib/mysql /home/mysql5/data
docker cp mysql5:/var/mysql/backup /home/mysql5/
docker stop mysql5
docker rm mysql5
rm -rf /home/mysql5/data/mysql.sock.lock
docker run -d -p 3307:3306 \
    --privileged=true \
    --restart=always \
    -v /home/mysql5/my.cnf.d:/etc/my.cnf.d \
    -v /home/mysql5/data:/var/lib/mysql \
    -v /home/mysql5/backup:/var/mysql/backup \
    -v /home/mysql5/log:/var/log/mysql \
    --name=mysql5 mysql:5.7
```

## 修改密码
```
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
```

## 创建用户
```
CREATE USER 'root'@'172.17.0.%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.17.0.%';
FLUSH PRIVILEGES;
```