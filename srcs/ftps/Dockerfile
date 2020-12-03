FROM alpine:latest

RUN apk update && apk add openssl \
	&& apk add vsftpd \
	&& apk add gettext \
	&& rm -rf /var/cache/apk/*

ENV __FTP_USER__=user
ENV __FTP_PASSWORD__=password
ENV __CLUSTER_EXTERNAL_IP__=192.168.99.101

COPY ./srcs/vsftpd.conf /tmp/vsftpd.conf
COPY ./srcs/bonjour.txt /home/user/hello_world.txt

EXPOSE 20 21 21000

COPY srcs/bootstrap.sh /usr/sbin

ENTRYPOINT ["bootstrap.sh"]
