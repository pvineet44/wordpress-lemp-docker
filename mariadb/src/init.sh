echo "=== Starting MariaDB Service ==="
service mysql start

echo "CREATE USER 'user'@'%' IDENTIFIED BY 'password';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

echo "GRANT ALL PRIVILEGES ON *.* TO 'vparekh'@'%' IDENTIFIED BY 'password';" | mysql -u     root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "CREATE DATABASE ft_server;" | mysql -u vparekh -ppassword
mysql -u vparekh -ppassword ft_server < /home/root/ft_server.sql
exec "$@"