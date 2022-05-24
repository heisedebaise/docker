# postgres official latest

## 运行

```bash
docker run -d \
    --privileged=true \
    --restart=always \
    -e POSTGRES_PASSWORD=postgres \
    --name=postgres \
    postgres:latest
sleep 10s
rm -rf /home/postgres
mkdir -p /home/postgres
docker cp postgres:/var/lib/postgresql/data /home/postgres/
docker stop -t 1 postgres
docker rm postgres
docker run -d \
    --privileged=true \
    --restart=always \
    --network=local \
    -v /home/postgres/data:/var/lib/postgresql/data \
    --name=postgres \
    postgres:latest

podman run -d \
    --privileged=true \
    -e POSTGRES_PASSWORD=postgres \
    --pod=local \
    --name=postgres \
    postgres:latest
sleep 10s
rm -rf $HOME/postgres
mkdir -p $HOME/postgres
podman cp postgres:/var/lib/postgresql/data $HOME/postgres/
podman stop -t 1 postgres
podman rm postgres
podman run -d \
    --privileged=true \
    --pod=local \
    -v $HOME/postgres/data:/var/lib/postgresql/data \
    --name=postgres \
    postgres:latest
```