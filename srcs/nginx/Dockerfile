FROM alpine:latest

RUN apk update \
	&& apk add nginx &&  mkdir -p /run/nginx \
	&& mkdir -p /var/www/my_server \
	&& apk add openssl \
	&& apk add openssh-server \
	&& apk add gettext \
	&& rm -rf /var/cache/apk/*
ENV __SSH_USER__=user
ENV	__SSH_PASSWORD__=password
ENV __PHPMYADMIN_IP__=192.168.99.101
ENV __WORDPRESS_IP__=192.168.99.101
ENV __WORDPRESS_PORT__=5050
ENV __PHPMYADMIN_PORT__=5000
EXPOSE 80 443 22
COPY ./srcs/srcs_nginx/setup_nginx.sh /usr/sbin
COPY ./srcs/srcs_nginx/server_config  /tmp/
COPY ./srcs/srcs_nginx/self-signed.conf /etc/nginx/snippets/
COPY ./srcs/srcs_ssh/setup_ssh.sh /usr/sbin
COPY ./srcs/srcs_ssh/authorized_keys /root/.ssh/authorized_keys
COPY ./srcs/srcs_ssh/authorized_keys /tmp 
COPY ./srcs/srcs_ssh/motd /etc/motd
COPY ./srcs/srcs_ssh/ssh_banner /tmp/ssh_banner
COPY ./srcs/srcs_ssh/sshd_config /etc/ssh/sshd_config
COPY ./srcs/bootstrap.sh /usr/sbin/
ENTRYPOINT ["bootstrap.sh"]
