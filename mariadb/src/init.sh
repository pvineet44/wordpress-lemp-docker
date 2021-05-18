echo "=== Starting MariaDB Service ==="

PASS=$(sh ./decode.sh U2FsdGVkX1+OXnQmiCHyB+p0gLv8bnNkJlKl8NHEtag=)


service mysql start


# echo "CREATE USER 'user'@'%' IDENTIFIED BY '$PASS';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' IDENTIFIED BY '$PASS';" | mysql -u root
touch 1
echo "FLUSH PRIVILEGES;" | mysql -u root
touch 2


echo "GRANT ALL PRIVILEGES ON *.* TO 'vparekh'@'localhost' IDENTIFIED BY '$PASS';" | mysql -u     root
touch 3
echo "FLUSH PRIVILEGES;" | mysql -u root
touch 4
echo "CREATE DATABASE ft_server;" | mysql -u vparekh -p$PASS
touch 5
mysql -u vparekh -p$PASS ft_server < /home/root/ft_server.sql
touch 6

exec "$@"