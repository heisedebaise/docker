# install

```bash
dnf config-manager --add-repo=https://download.docker.com/linux/fedora/docker-ce.repo

dnf install -y docker-ce
systemctl enable docker
systemctl restart docker
```

```
docker network create local
```