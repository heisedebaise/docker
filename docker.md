# install

```
curl -fsSL https://get.docker.com | bash -s docker
```

## centos

```
dnf remove -y podman

dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

dnf install -y docker-ce
systemctl enable docker
systemctl restart docker
```

## ubuntu

```
apt update
apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install -y docker-ce
systemctl enable docker
systemctl restart docker
```

# network

```
docker network create local
```

# mirror

```
echo '{
  "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"]
}' > /etc/docker/daemon.json
```
