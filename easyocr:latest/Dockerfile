FROM python:3.8

RUN pip install -i https://mirrors.aliyun.com/pypi/simple/ easyocr \
    && mkdir -p /easyocr/image

VOLUME [ "/root/.EasyOCR/model", "/easyocr/image" ]