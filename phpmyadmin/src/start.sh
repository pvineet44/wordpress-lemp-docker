echo "=== Starting PMA Service ==="
service nginx start
sh /home/root/change_ip.sh
/etc/init.d/php7.4-fpm start
exec "$@"

