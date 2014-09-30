CREATE DATABASE wordpress;
CREATE USER admin@localhost IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON wordpress.* TO admin@localhost;
FLUSH PRIVILEGES;
exit