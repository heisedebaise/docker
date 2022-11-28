# centos repo

aliyun

```
rename '.repo' '.repo.bak' /etc/yum.repos.d/CentOS*.repo

curl https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo -o /etc/yum.repos.d/Centos-vault-8.5.2111.repo
curl https://mirrors.aliyun.com/repo/epel-archive-8.repo -o /etc/yum.repos.d/epel-archive-8.repo

sed -i 's/mirrors.cloud.aliyuncs.com/url_tmp/g'  /etc/yum.repos.d/Centos-vault-8.5.2111.repo
sed -i 's/mirrors.aliyun.com/mirrors.cloud.aliyuncs.com/g' /etc/yum.repos.d/Centos-vault-8.5.2111.repo
sed -i 's/url_tmp/mirrors.aliyun.com/g' /etc/yum.repos.d/Centos-vault-8.5.2111.repo
sed -i 's/mirrors.aliyun.com/mirrors.cloud.aliyuncs.com/g' /etc/yum.repos.d/epel-archive-8.repo

dnf clean all
dnf makecache
```

tsinghua

```
sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org/$contentdir|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-*.repo
```

# centos 9

```
dnf install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable docker
systemctl restart docker
```