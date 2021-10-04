FROM centos:base

RUN dnf install -y gcc wget \
    && wget -c https://golang.org/dl/go1.16.8.linux-amd64.tar.gz -O - | tar -xz -C /usr/local \
    && echo 'export PATH=$PATH:/usr/local/go/bin' > /etc/profile.d/go.sh

CMD [ "sleep", "1024d" ]