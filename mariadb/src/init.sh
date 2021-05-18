echo "=== Starting MariaDB Service ==="

PASS=$(sh ./decode.sh U2FsdGVkX1+OXnQmiCHyB+p0gLv8bnNkJlKl8NHEtag=)


service mysql start


echo "CREATE USER 'user'@'%' IDENTIFIED BY '$PASS';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "CREATE DATABASE ft_server;" | mysql -u user -p$PASS
# mysql -u user -p$PASS ft_server < /home/root/ft_server.sql

echo "GRANT ALL PRIVILEGES ON *.* TO 'vparekh'@'localhost' IDENTIFIED BY 'password';" | mysql -u     root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "CREATE DATABASE ft_server;" | mysql -u vparekh -ppassword
mysql -u vparekh -ppassword ft_server < /home/root/ft_server.sql


exec "$@"