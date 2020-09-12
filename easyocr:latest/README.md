# easyocr:latest

## 构建
```bash
docker build -t easyocr:latest easyocr\:latest/

podman build -t easyocr:latest easyocr\:latest/
```

## 运行
```bash
docker run -it \
    --privileged=true \
    --name=python easyocr:latest

podman run -it \
    --privileged=true \
    --name=python easyocr:latest
```

```
pip install --upgrade pip  -i https://mirrors.aliyun.com/pypi/simple/
pip install easyocr -i https://mirrors.aliyun.com/pypi/simple/
```