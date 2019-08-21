FROM alpine:3.9
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache  sudo curl bash  expect \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* 
WORKDIR /usr/local/frp/
ADD frpc /usr/bin/
ADD frpc-lite.ini /etc/frp/frpc-lite.ini
ADD entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/frpc
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]