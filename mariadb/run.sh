echo "Launching docker container 'mariadb' with port redirection 3306-->3306 and 1235-->443"
sudo docker run -ti -p3306:3306 ft_mariadb
