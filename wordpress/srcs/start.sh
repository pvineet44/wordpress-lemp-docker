#!/bin/sh

# # We retrieve external IP
# IP=$(cat /ip.txt)
# # We replace the template IP by the actual kubernetes IP
# sed -i "s/AAAIPAAA/$IP/g" /www/wp-config.php
# # We launch a simple web server hosting Wordpress
# php -S 0.0.0.0:5050 -t /www/

# echo "=== Starting WP Service ==="
# sh /home/root/change_ip.sh
# php -S 0.0.0.0:5050 -t /home/root/www/
# exec "$@"


echo "=== Starting WP Service ==="
service nginx start
sh /home/root/change_ip.sh
/etc/init.d/php7.4-fpm start
exec "$@"

