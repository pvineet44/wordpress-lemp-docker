FROM ubuntu:20.04

RUN echo '\e[36m\e[1m=== Updating system ===\e[0m'
RUN apt -y update
RUN apt -y upgrade

RUN echo ' \e[36m\e[1m=== Installing MariaDB ===\e[0m'
RUN apt-get update
RUN apt-get install -y mariadb-server

RUN echo ' \e[36m\e[1m=== Installing tools ===\e[0m'
RUN apt install -y curl
RUN apt install -y vim
RUN apt install -y wget

RUN echo ' \e[36m\e[1m=== Creating tables ===\e[0m'
# COPY src/ft_server.sql /home/root/
COPY src/init.sh /home/root/
COPY src/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN echo ' \e[36m\e[1m=== Starting services ===\e[0m'
# CMD bash /home/root/init.sh && /bin/sh


# EXPOSE 3306

LABEL version="1.0"
LABEL description="MariaDB Server"

# CMD ["mysqld"]
