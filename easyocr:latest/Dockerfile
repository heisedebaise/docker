FROM python:3.8

RUN pip install git+git://github.com/jaidedai/easyocr.git -i https://pypi.tuna.tsinghua.edu.cn/simple \
    && mkdir -p /easyocr/image

COPY main.py /easyocr/

VOLUME [ "/root/.EasyOCR/model", "/easyocr/image" ]

EXPOSE 8080

CMD [ "python", "/easyocr/main.py" ]