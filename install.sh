#!/bin/bash
#font: https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu

    sudo apt-get update

#apache
    sudo apt-get install apache2
    sudo cp etc/apache2/apache2.conf /etc/apache2/apache2.conf

    #apache test
    ##ifconfig eth0 | grep "inet " | awk '{ print $3 }'
    ##ifconfig eth1 | grep "inet " | awk '{ print $3 }'

    #to change port, change this two files, and restart apache
    ##sudo vim /etc/apache2/ports.conf
    ##sudo vim /etc/apache2/sites-enabled/000-default.conf

#mysql
    sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
    sudo mysql_install_db
    sudo /usr/bin/mysql_secure_installation

#php
    sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
    sudo cp etc/apache2/mods-enabled/dir.conf /etc/apache2/mods-enabled/

    #php test
    ##sudo cp var/www/html/info.php /var/www/html/

    sudo service apache2 restart

#wordpress
    sudo apt-get install php5-gd libssh2-php

    mysql -uroot -psecret < home/dest/wordpress/wordpress-setup.sql
    sudo cp home/dest/wordpress/wp-config.php /var/www/html

    cd /tmp
    wget http://wordpress.org/latest.tar.gz
    tar xzvf latest.tar.gz

    sudo rsync -avP /tmp/wordpress/ /var/www/html/
    cd /var/www/html

    sudo wget -c https://raw.githubusercontent.com/aidewind/aide/master/db.php

    #do this guide to understand the demo user https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-14-04
    ##sudo chown -R demo:www-data *

    mkdir /var/www/html/wp-content/uploads
    sudo chown -R :www-data /var/www/html/wp-content/uploads

    #open browser to finish up! or... =^)
    ##mysql -uroot -psecret < home/dest/wordpress/wordpress.sql

    #to do : enable more cool permanlinks
    ##http://codex.wordpress.org/Changing_File_Permissions
    ##https://www.digitalocean.com/community/tutorials/how-to-set-up-mod_rewrite

#govpress theme
    cd /var/www/html/wp-content/themes
    wget -c https://downloads.wordpress.org/theme/govpress.1.3.0.zip
    unzip govpress.1.3.0.zip
