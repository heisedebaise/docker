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
    --name=easyocr easyocr:latest

podman run -it \
    --privileged=true \
    --name=easyocr easyocr:latest
```

## 运行（推荐）
```bash
docker run -it \
    --privileged=true \
    --network=local \
    -v /home/easyocr/model:/root/.EasyOCR/model \
    -v /home/easyocr/image:/easyocr/image \
    --name=easyocr easyocr:latest

mkdir -p /home/easyocr/model
mkdir -p /home/easyocr/image
podman run -it \
    --privileged=true \
    --pod=local \
    -v /home/easyocr/model:/root/.EasyOCR/model \
    -v /home/easyocr/image:/easyocr/image \
    --name=easyocr easyocr:latest

mkdir -p $HOME/easyocr/model
mkdir -p $HOME/easyocr/image
podman run -it \
    --privileged=true \
    --pod=local \
    -v $HOME/easyocr/model:/root/.EasyOCR/model \
    -v $HOME/easyocr/image:/easyocr/image \
    --name=easyocr easyocr:latest
```