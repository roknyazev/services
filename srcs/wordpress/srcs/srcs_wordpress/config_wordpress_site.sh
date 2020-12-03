#!/bin/sh


cd /usr/share/webapps/wordpress
wp core is-installed > /dev/null 2>&1
if [[ $? = 0 ]]
then	
	echo "wp-cli: no need to reinstall wordpress, it already has a database"
	echo "		name: $__WORDPRESS_DB_NAME__"
	echo "		at address: $__WORDPRESS_DB_HOST__"
	exit 0
fi

echo "wp-cli: wordpress not installed yet at address: $__WORDPRESS_DB_HOST__ with database: $__WORDPRESS_DB_NAME__ "

LIMIT=11
while :
do
	echo "waiting for database conexion"
	wp core is-installed 2>&1 | grep "Error establishing" > /dev/null
	if [[ $? = 0 ]]
	then
		let "LIMIT--"
		echo "$LIMIT"
		sleep 1
		if [[ $LIMIT = 0 ]]
		then
			exit 1
		fi
	else
		echo "OK!"
		break	
	fi
done

wp core install --url=http://${__WORDPRESS_SVC_IP__}:${__WORDPRESS_SVC_PORT__} --title="Ну здарова" --admin_user=user --admin_password=password --admin_email=user@student.21-school.ru --skip-email
wp term create category category0
wp post create /tmp/content_first_post.txt --post_author=1 --post_category="category0" --post_title="Анекдот" --post_status=publish
wp user create user1 user1@example.com --role=subscriber --user_pass=password1
wp user create user2 user2@example.com --role=subscriber --user_pass=password2
wp user create user3 user3@example.com --role=subscriber --user_pass=password3
wp user create user4 user4@example.com --role=subscriber --user_pass=password4
wp option update blogdescription "Как оно?"
