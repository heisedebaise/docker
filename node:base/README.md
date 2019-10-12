# node:base

- Node版本号为：`10.16.3`。
- 启动时会自动搜寻并执行`/data/config/*.sh`。
- 日志会被重定向到`/data/log/console.out`。
- 端口号`port`根据具体场景选择。
- 指令`node index.js`根据具体场景选择，如：`npm start`、`npm run build`等。

## 构建
```bash
docker build -t node:base docker/node\:base/
```

## 运行
```bash
docker run -d -p port:port \
    --privileged=true \
    --restart=always \
    --name=node node:base node index.js
```

## 运行（推荐）
```bash
mkdir -p /home/node/config
mkdir -p /home/node/app
mkdir -p /home/node/log
docker run -d -p port:port \
    --privileged=true \
    --restart=always \
    -v /home/node/config:/data/config \
    -v /home/node/app:/data/app \
    -v /home/node/log:/data/log \
    --name=node node:base node index.js
```

