# !/bin/bash

while ! mariadb -hdb -u$SQL_USER -p$SQL_PASSWORD $SQL_DATABASE &>/dev/null; do
    sleep 3
    echo "waiting"
done

sudo wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=db:3306 --path="/var/www/wordpress" --allow-root

chmod -R 755 /var/www/wordpress

wp core install --title=$WP_TITLE \
				--admin_user=$WP_ADMIN_USER \
				--admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_MAIL \
				--url=$WP_URL \
                --path="/var/www/wordpress" \
				--allow-root

wp user create $WP_USER $WP_USER_MAIL  \
                --role=author  \
                --user_pass=$WP_USER_PASSWORD  \
                --path="/var/www/wordpress" \
                --allow-root

/usr/sbin/php-fpm7.3 --nodaemonize --allow-to-run-as-root