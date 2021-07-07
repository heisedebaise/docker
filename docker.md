# install

## centos

```bash
dnf remove -y podman

dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

dnf install -y docker-ce
systemctl enable docker
systemctl restart docker
```

## network

```
docker network create local
```

## mirror

```
echo '{
  "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"]
}' > /etc/docker/daemon.json
```
