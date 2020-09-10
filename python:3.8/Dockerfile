FROM centos:base

RUN dnf install -y python38 \
    dnf groupinstall -y 'Development Tools' \
    ln -s /bin/python3.8 /bin/python \
    ln -s /bin/pip3.8 /bin/pip