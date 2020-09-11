FROM python:3.8

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple easyocr \
    && mkdir -p /easyocr/image

COPY main.py /easyocr/

VOLUME [ "/root/.EasyOCR/model", "/easyocr/image" ]

EXPOSE 8080

CMD [ "python", "/easyocr/main.py" ]