#!/bin/bash
#font: https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu
sudo apt-get update

#apache
sudo apt-get install apache2
sudo cp etc/apache2/apache2.conf /etc/apache2/apache2.conf

#apache test
#ifconfig eth0 | grep "inet " | awk '{ print $3 }'
#ifconfig eth1 | grep "inet " | awk '{ print $3 }'

#mysql
sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
sudo mysql_install_db
sudo /usr/bin/mysql_secure_installation

#php
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
sudo cp etc/apache2/mods-enabled/dir.conf /etc/apache2/mods-enabled/

#php test
#sudo cp var/www/html/info.php /var/www/html/

sudo service apache2 restart