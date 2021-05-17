if [ $# -eq 0 ] ; then
    echo 'No domain/IP passed'
    exit 1
fi
sed -i 's/DOMAIN_NAME/'${1}'/g' ./mariadb/src/ft_server.sql
sed -i 's/DOMAIN_NAME/'${1}'/g' ./mysql-dump/ft_server.sql
sed -i 's/DOMAIN_NAME/'${1}'/g' ./phpmyadmin/src/localhost
sed -i 's/DOMAIN_NAME/'${1}'/g' ./wordpress/srcs/localhost
sed -i 's/DOMAIN_NAME/'${1}'/g' ./wordpress/Dockerfile
sed -i 's/DOMAIN_NAME/'${1}'/g' ./phpmyadmin/Dockerfile
echo $1