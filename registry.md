# Registry

## server

```
docker pull registry:latest

mkdir -p /home/registry/cert
openssl req -newkey rsa:4096 -nodes -sha256 -keyout /home/registry/cert/registry.key -x509 -days 36500 -out /home/registry/cert/registry.crt

docker run -d -p 5000:5000 \
    --privileged=true \
    --restart=always \
    -v /home/registry/data:/var/lib/registry \
    -v /home/registry/cert:/etc/docker/cert \
    -e REGISTRY_HTTP_TLS_CERTIFICATE=/etc/docker/cert/registry.crt \
    -e REGISTRY_HTTP_TLS_KEY=/etc/docker/cert/registry.key \
    --name=registry registry:latest
```

## client

```
mkdir -p /etc/docker/certs.d/registry:5000
scp root@registry:/home/registry/cert/registry.crt /etc/docker/certs.d/registry:5000/ca.crt
```