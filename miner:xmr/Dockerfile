FROM centos:base

RUN mkdir -p /xmrig

COPY xmrig-6.10.0/* /xmrig/

RUN chmod +x /xmrig/run.sh

CMD [ "/xmrig/run.sh" ]
