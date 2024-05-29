#!/bin/bash

cd /var/www/html/
wp core download --allow-root

wp config create --dbname=$DB_NAME --dbuser=$USER --dbhost=mariadb --dbpass=$PASS --skip-check --allow-root
# wait for db
while ! wp db check --allow-root
do    
    sleep 2
done

wp core install --url=https://mtaib.42.fr --title=$TITLE --admin_user=$ADMIN --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root
wp user create $WP_USER $WP_USER_EMAIL --role=$ROLE --user_pass=$WP_PASS --allow-root
exec "$@"