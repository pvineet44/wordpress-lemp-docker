FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive 

RUN echo '\e[36m\e[1m=== Updating system ===\e[0m'
RUN apt -y update
RUN apt -y upgrade

RUN echo ' \e[36m\e[1m=== Installing PHP ===\e[0m'
RUN apt install -y php php-mysql php-fpm php-mbstring

RUN echo ' \e[36m\e[1m=== Installing tools ===\e[0m'
RUN apt install -y curl
RUN apt install -y vim
RUN apt install -y wget


RUN echo ' \e[36m\e[1m=== Installing NGINX ===\e[0m'
RUN apt install -y nginx


RUN echo ' \e[36m\e[1m=== Copying content ===\e[0m'
RUN mkdir /home/root/
RUN mkdir /home/root/www
RUN mkdir /home/root/www/phpmyadmin
COPY src/localhost ./home/root/localhost
RUN chown -R www-data:www-data /home/root/www/*
RUN chmod -R 755 /home/root/www/*
RUN mv /home/root/localhost /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
COPY src/start.sh /home/root/
COPY src/change_ip.sh /home/root
COPY src/config.inc.php /home/root/www/phpmyadmin
RUN echo ' \e[36m\e[1m=== Installing PHPMyAdmin ===\e[0m'
WORKDIR /home/root/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.1/phpMyAdmin-4.9.1-english.tar.gz
RUN tar xzf phpMyAdmin-4.9.1-english.tar.gz --strip-components=1 -C /home/root/www/phpmyadmin

RUN echo ' \e[36m\e[1m=== Installing SSL ===\e[0m'
RUN mkdir /home/root/mkcert
WORKDIR /home/root/mkcert
RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
RUN mv mkcert-v1.1.2-linux-amd64 mkcert
RUN chmod +x mkcert
RUN ./mkcert -install
RUN ./mkcert DOMAIN_NAME

#CMD bash /home/root/change_ip.sh

RUN echo ' \e[36m\e[1m=== Starting PHPMyAdmin ===\e[0m'
# CMD bash /home/root/start.sh && /bin/sh

# EXPOSE 80
# EXPOSE 443