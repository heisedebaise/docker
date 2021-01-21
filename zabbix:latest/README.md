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

```
zabbix_get -s 172.18.0.1 -p 10050 -k "system.cpu.load[all,avg1]"
```

## web

```
docker run -d -p 8080:8080 \
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

```
pacman -S zabbix-agent
systemctl enable zabbix-agent
systemctl start zabbix-agent
```

```
cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.o
sed -i '/# StartAgents/a\StartAgents=0' /etc/zabbix/zabbix_agentd.conf
sed -i 's/Hostname=Zabbix server/Hostname=zabbix agent/g' /etc/zabbix/zabbix_agentd.conf
systemctl restart zabbix-agent
```

## gpu

## agent

```
# https://github.com/plambe/zabbix-nvidia-smi-multi-gpu/
git clone https://github.com/plambe/zabbix-nvidia-smi-multi-gpu.git
cat zabbix-nvidia-smi-multi-gpu/userparameter_nvidia-smi.conf.linux >> /etc/zabbix/zabbix_agentd.conf
mkdir -p /etc/zabbix/scripts
cp zabbix-nvidia-smi-multi-gpu/get_gpus_info.sh /etc/zabbix/scripts/
chmod +x /etc/zabbix/scripts/get_gpus_info.sh
systemctl restart zabbix-agent
```

## web

```
Configuration > Templates > Import << zabbix-nvidia-smi-multi-gpu/zbx_nvidia-smi-multi-gpu.xml
Hosts > {node} > Templates > Link new templates > Template Nvidia GPUs Performance
Update
```
