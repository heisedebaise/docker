# mysql:8.0

构建基于`mysql-community`的MySQL服务，版本号为：8.0。
- 当`/var/backup/schemas`存在时，将每小时自动备份数据库，备份的数据库由`schemas`文件指定，每个数据库名占一行。
- 自动备份时需提供`-h127.0.0.1 -uroot -proot`用户认证。
- 备份文件会被压缩为`tar.gz`文件，并且超过`7`天的备份文件会被删除。

## 构建
```bash
docker build -t mysql:8.0 mysql\:8.0/

podman build -t mysql:8.0 mysql\:8.0/
```

## 运行
```bash
docker run -d -p 3306:3306 \
    --privileged=true \
    --restart=always \
    --name=mysql mysql:8.0

podman run -d -p 3306:3306 \
    --privileged=true \
    --name=mysql mysql:8.0
```

## 运行（推荐）
```bash
docker run -d \
    --privileged=true \
    --restart=always \
    --name=mysql mysql:8.0
sleep 10s
mkdir -p /home/mysql
docker cp mysql:/etc/my.cnf.d /home/mysql/
docker cp mysql:/var/lib/mysql /home/mysql/data
docker cp mysql:/var/mysql/backup /home/mysql/
docker stop mysql
docker rm mysql
rm -rf /home/mysql/data/mysql.sock.lock
docker run -d \
    --privileged=true \
    --restart=always \
    --network=local \
    -v /home/mysql/my.cnf.d:/etc/my.cnf.d \
    -v /home/mysql/data:/var/lib/mysql \
    -v /home/mysql/backup:/var/mysql/backup \
    -v /home/mysql/log:/var/log/mysql \
    --name=mysql mysql:8.0

podman run -d \
    --privileged=true \
    --name=mysql mysql:8.0
sleep 10s
mkdir -p /home/mysql
podman cp mysql:/etc/my.cnf.d /home/mysql/
podman cp mysql:/var/lib/mysql /home/mysql/data
podman cp mysql:/var/mysql/backup /home/mysql/
podman stop mysql
podman rm mysql
rm -rf /home/mysql/data/mysql.sock.lock
podman run -d \
    --privileged=true \
    --pod=local \
    -v /home/mysql/my.cnf.d:/etc/my.cnf.d \
    -v /home/mysql/data:/var/lib/mysql \
    -v /home/mysql/backup:/var/mysql/backup \
    -v /home/mysql/log:/var/log/mysql \
    --name=mysql mysql:8.0

podman run -d \
    --privileged=true \
    --pod=local \
    --name=mysql mysql:8.0
sleep 10s
mkdir -p $HOME/mysql/log
podman cp mysql:/etc/my.cnf.d $HOME/mysql/
podman cp mysql:/var/lib/mysql $HOME/mysql/data
podman cp mysql:/var/mysql/backup $HOME/mysql/
podman stop mysql
podman rm mysql
rm -rf $HOME/mysql/data/mysql.sock.lock
podman run -d \
    --privileged=true \
    --pod=local \
    -v $HOME/mysql/my.cnf.d:/etc/my.cnf.d \
    -v $HOME/mysql/data:/var/lib/mysql \
    -v $HOME/mysql/backup:/var/mysql/backup \
    -v $HOME/mysql/log:/var/log/mysql \
    --name=mysql mysql:8.0
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