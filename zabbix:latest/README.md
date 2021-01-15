# zabbix

## server

```
docker run -d -p 10051:10051 \
    --privileged=true \
    --restart=always \
    --network=local \
    -e DB_SERVER_HOST="mysql" \
    -e MYSQL_DATABASE="d_zabbix" \
    -e MYSQL_USER="root" \
    -e MYSQL_PASSWORD="root" \
    --name zabbix-server zabbix/zabbix-server-mysql:alpine-latest
```

## web

```
docker run -d \
    --privileged=true \
    --restart=always \
    --network=local \
    -e DB_SERVER_HOST="mysql" \
    -e MYSQL_DATABASE="d_zabbix" \
    -e MYSQL_USER="root" \
    -e MYSQL_PASSWORD="root" \
    -e PHP_TZ="Asia/Shanghai" \
    --name zabbix-web zabbix/zabbix-web-nginx-mysql:alpine-latest
```

## agent

```
docker run -d -p 10050:10050 \
    --privileged=true \
    --restart=always \
    --network=local \
    -e ZBX_HOSTNAME="agent" \
    -e ZBX_SERVER_HOST="zabbix-server" \
    --name zabbix-agent zabbix/zabbix-agent:latest
```

## gpu

```
https://github.com/plambe/zabbix-nvidia-smi-multi-gpu/
```