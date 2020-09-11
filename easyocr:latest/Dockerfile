FROM python:3.8

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple easyocr \
    && mkdir -p /easyocr/image

VOLUME [ "/root/.EasyOCR/model", "/easyocr/image" ]