FROM alpine:latest

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --update  bash  expect  \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

ADD frpc /usr/local/frp/frpc
ADD frpc-lite.ini /uar/local/frp/frpc-lite.ini
ADD entrypoint.sh /uar/local/frp/entrypoint.sh
RUN chmod +x /usr/local/frp/frpc
RUN chmod +x /uar/local/frp/entrypoint.sh

WORKDIR /usr/local/frp/
ENTRYPOINT [ "/uar/local/frp/entrypoint.sh" ]