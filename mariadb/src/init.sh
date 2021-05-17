echo "=== Starting MariaDB Service ==="

PASS=$(sh ./decode.sh U2FsdGVkX1+7QmvSs5V1duRBr/qJCBOlBpJIoP/QFZM=)


service mysql start


echo "CREATE USER 'user'@'%' IDENTIFIED BY '$PASS';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "CREATE DATABASE ft_server;" | mysql -u user -p$PASS
mysql -u user -p$PASS ft_server < /home/root/ft_server.sql

exec "$@"