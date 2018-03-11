FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y nginx
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash 
RUN apt-get install -y nodejs
RUN apt-get install -y python

RUN npm install -g ghost-cli

RUN mkdir -p /var/www/ghost
RUN useradd -ms /bin/bash admin
RUN usermod -aG sudo admin
RUN chown admin:admin /var/www/ghost
RUN chmod 775 /var/www/ghost

USER admin
WORKDIR /var/www/ghost

#RUN ghost install --db=sqlite3 --dbpath=/content/data/ghost.db --dbuser=admin --dbpass=admin --noprompt
RUN ghost install local



