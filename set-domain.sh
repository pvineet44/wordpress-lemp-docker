if [ $# -eq 0 ] ; then
    echo 'No domain/IP passed'
    exit 1
fi

if [$2 -eq 'mysql' ] ; then
    sed -i 's/DOMAIN_NAME/'${1}'/g' ./mariadb/src/ft_server.sql
    sed -i 's/DOMAIN_NAME/'${1}'/g' ./mysql-dump/ft_server.sql
fi 


if [$2 -eq 'phpmyadmin' ] ; then
    sed -i 's/DOMAIN_NAME/'${1}'/g' ./phpmyadmin/src/localhost
    sed -i 's/DOMAIN_NAME/'${1}'/g' ./phpmyadmin/Dockerfile
fi


if [$2 -eq 'wordpress' ] ; then
    sed -i 's/DOMAIN_NAME/'${1}'/g' ./wordpress/srcs/localhost
    sed -i 's/DOMAIN_NAME/'${1}'/g' ./wordpress/Dockerfile
fi 

echo $1