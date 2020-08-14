# install

## centos

```bash
dnf config-manager --add-repo=https://download.docker.com/linux/fedora/docker-ce.repo

dnf install -y docker-ce
systemctl enable docker
systemctl restart docker
```

# network

```
docker network create local
```