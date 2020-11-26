FROM	alpine

RUN	apk update
RUN	apk add openssl vsftpd
RUN mkdir -p /var/ftp

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN	mkdir -p /ftp_anon /wrudy
RUN	printf "move files from the window on the left here\n" > /wrudy/Readme.txt
RUN	printf "root\nroot\n" | adduser wrudy -s /bin/false -h /wrudy
RUN	printf "/bin/false\n" >> /etc/shells
RUN	chown wrudy:wrudy /wrudy
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RF/ST=MSK/L=SCH/O=21/CN=wrudy' -keyout /etc/vsftpd/ftps.key -out /etc/vsftpd/ftps.crt

EXPOSE	20 21 21000

ENTRYPOINT [ "vsftpd", "/etc/vsftpd/vsftpd.conf" ]
