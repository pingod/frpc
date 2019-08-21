#!/bin/sh


if $(env|grep server_addr > /dev/null );then
#将容器启动时注入的变量保存到/etc/profile
echo  "export $(env|grep server_addr)" >> /etc/profile
fi


if [ -z "$server_addr" ]; then
	server_addr=0.0.0.0
fi
if [ -z "$server_port" ]; then
	server_port=7100
fi
if [ -z "$privilege_token" ]; then
	privilege_token=405520
fi
if [ -z "$login_fail_exit" ]; then
	login_fail_exit=true
fi

if [ -z "$hostname_in_docker" ]; then
    hostname_in_docker=hostname_in_docker
fi

if [ -z "$ip_out_docker" ]; then
    ip_out_docker=127.0.0.1
fi

if [ -z "$ssh_port_out_docker" ]; then
    ssh_port_out_docker=22
fi

export config_file_frpc=/etc/frp/frpc-lite.ini
sudo sed -i 's/server_addr = 0.0.0.0/server_addr = '$server_addr'/g' ${config_file_frpc}
sudo sed -i 's/server_port = 7100/server_port = '$server_port'/g' ${config_file_frpc}
sudo sed -i 's/privilege_token = 12345678/privilege_token = '$privilege_token'/g' ${config_file_frpc}
sudo sed -i 's/login_fail_exit = true/login_fail_exit = '$login_fail_exit'/g' ${config_file_frpc}
sudo sed -i 's/hostname_in_docker/'$hostname_in_docker'/g' ${config_file_frpc}
sudo sed -i 's/ip_out_docker/'$ip_out_docker'/g' ${config_file_frpc}
sudo sed -i 's/ssh_port_out_docker/'$ssh_port_out_docker'/g' ${config_file_frpc}

/usr/bin/frpc -c ${config_file_frpc} 