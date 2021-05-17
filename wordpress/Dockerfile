FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive 

# We install packages
RUN apt -y update
RUN apt -y upgrade
RUN apt install -y curl
RUN apt install -y vim
RUN apt install -y wget
RUN mkdir /www 
RUN apt install -y php php-mysql php-fpm
RUN echo ' \e[36m\e[1m=== Installing NGINX ===\e[0m'
RUN apt install -y nginx

RUN echo ' \e[36m\e[1m=== Installing Wordpress ===\e[0m'
RUN mkdir /home/root/
RUN mkdir /home/root/www
COPY srcs/www /home/root/www

COPY srcs/localhost ./home/root/localhost
RUN chown -R www-data:www-data /home/root/www/*
RUN chmod -R 755 /home/root/www/*
RUN mv /home/root/localhost /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
COPY srcs/start.sh /home/root/
COPY srcs/change_ip.sh /home/root

RUN echo ' \e[36m\e[1m=== Installing SSL ===\e[0m'
RUN mkdir /home/root/mkcert
WORKDIR /home/root/mkcert
RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
RUN mv mkcert-v1.1.2-linux-amd64 mkcert
RUN chmod +x mkcert
RUN ./mkcert -install
RUN ./mkcert DOMAIN_NAME

# We save extrenal IP
#RUN echo $IP > ip.txt

# EXPOSE 5050
# CMD ./start.sh