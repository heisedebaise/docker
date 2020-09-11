FROM python:3.8

RUN pip install -i https://mirrors.aliyun.com/pypi/simple/ easyocr \
    && mkdir -p /easyocr/image

COPY main.py /easyocr/

VOLUME [ "/root/.EasyOCR/model", "/easyocr/image" ]

EXPOSE 8080

CMD [ "python", "/easyocr/main.py" ]