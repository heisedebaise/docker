#!/bin/bash

sh config.sh

yum install -y kubernetes-master etcd

sed -i 's/localhost:2379/0.0.0.0:2379/g' /etc/etcd/etcd.conf
