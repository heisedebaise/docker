整理docker文档，统一开发、测试、生产环境。

# 压缩

建议通过使用`save/load`来减少占用的磁盘空间。

```bash
# docker images -a
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
mysql               5.7                 abe466bbe17a        8 seconds ago       1.56 GB
<none>              <none>              000cda67b76a        9 seconds ago       1.56 GB
<none>              <none>              acc06e4f2306        10 seconds ago      1.56 GB
<none>              <none>              b9b3f4b016a0        10 seconds ago      1.56 GB
<none>              <none>              e61eeaba8b89        11 seconds ago      1.56 GB
<none>              <none>              5cfabd786e5f        11 seconds ago      1.56 GB
<none>              <none>              e2c655c4ac87        11 seconds ago      1.56 GB
<none>              <none>              0530973389e0        12 seconds ago      1.56 GB
centos              base                298cebb50a9e        31 minutes ago      390 MB
docker.io/centos    latest              3fa822599e10        3 months ago        204 MB
# docker save -o mysql.tar mysql:5.7
# docker rmi mysql:5.7 
Untagged: mysql:5.7
Deleted: sha256:abe466bbe17a42c980056113ac275f37da804391fd92dabd8a897306bdbdd7cd
Deleted: sha256:000cda67b76ae9ef96b599ce079773a1fe3459444c374242ac12e05339bb2bd1
Deleted: sha256:acc06e4f2306861c9cb4c689b0a8038adc185f2f8d48a55a1ec73d4660dac643
Deleted: sha256:b9b3f4b016a0c07dc4ef1d9ed0a5faba3ebe495e1dc748e66f52f1c79c9b7866
Deleted: sha256:9738772ebe15cd0c48cab18227e085bf220d1532dc4eeb10224638c73920ac77
Deleted: sha256:e2c655c4ac8713b08b861c26230256d1cc465b4219de4ba81eec47b027893753
Deleted: sha256:427a098d607d6686dc10e82bb33228054a74766a1dc3665c3c07c2f3be2a8060
Deleted: sha256:5cfabd786e5f5cd1e420bf4d36b581ae4513f7452c37bc3c603d54d0022252e8
Deleted: sha256:8cf4d14a195bcbeb31461328433a215697d6cb51865449d95fc677edf40a0f33
Deleted: sha256:e61eeaba8b890dbecd50765b0706cfa62cbf53567e6388c04206d76d0a1cb90b
Deleted: sha256:fca8dda3e5633cb0fb13eb7eed8017ce653d903633016bf8f46e87e4340315ad
Deleted: sha256:0530973389e07bcead9ac7c55f2b30ead7cf03d18988d0b0e1ff005314b88d7b
Deleted: sha256:a2789d184d56aa207793506f376575df648a668a8a3bf3bdb6684d40cf8b7261
# docker load -i mysql.tar 
d714fbaa7464: Loading layer [==================================================>]  1.17 GB/1.17 GB
8c5fceddc3a6: Loading layer [==================================================>] 4.096 kB/4.096 kB
670d32ec32d8: Loading layer [==================================================>]  2.56 kB/2.56 kB
6952cced9123: Loading layer [==================================================>] 3.072 kB/3.072 kB
61b731fe9224: Loading layer [==================================================>] 6.144 kB/6.144 kB
Loaded image: mysql:5.7
# docker images -a
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
mysql               5.7                 abe466bbe17a        About a minute ago   1.56 GB
centos              base                298cebb50a9e        32 minutes ago       390 MB
docker.io/centos    latest              3fa822599e10        3 months ago         204 MB
```

## docker stats format

```bash
docker stats --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}'
```