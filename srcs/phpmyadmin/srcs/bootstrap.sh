#!/bin/sh

setup_nginx.sh
setup_phpmyadmin.sh

nginx
status=$?
if [ $status -ne 0 ];
then
	echo "Failed to start nginx: $status"
	exit $status
fi

php-fpm7
status=$?
if [ $status -ne 0 ];
then
	echo "Failed to start php-fpm7: $status"
	exit $status
fi

while sleep 20;
do
	ps aux |grep nginx |grep -q -v grep
	PROCESS_1_STATUS=$?
	ps aux |grep php-fpm |grep -q -v grep
	PROCESS_2_STATUS=$?
	if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ];
	then
		echo "One of the processes has already exited."
		exit 1
	fi
done

