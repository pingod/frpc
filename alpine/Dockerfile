FROM alpine:latest

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --update  bash  expect  \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

WORKDIR /usr/local/frp/
ADD frpc .
ADD frpc-lite.ini .
ADD entrypoint.sh .
RUN chmod +x ./frpc
RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "/usr/local/frp/entrypoint.sh" ]