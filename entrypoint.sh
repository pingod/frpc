#!/bin/sh

#frps ip地址
remote_ip=${remote_ip}

#配置文件中用于描述服务的标记名称
service_name=${service_name}
#配置文件中用于描述frc所在位置的标记名称
position_note=${position_note}
##配置文件中本地服务的端口号
local_port=${local_port}
##配置文件中本地服务的协议
service_type=${service_type}


sed -i "s#0.0.0.0#${remote_ip}#g" /usr/local/frp/frpc-lite.ini

echo "
[range:${service_name} ${position_note}]
type = ${service_type}
local_ip = 127.0.0.1
local_port = ${local_port}
remote_port = 0
use_encryption = true
use_compression = true
" >> /usr/local/frp/frpc-lite.ini

/usr/local/frp/frpc -c /usr/local/frp/frpc-lite.ini