CREATE DATABASE sfjs DEFAULT CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON sfjs.* TO 'sfjs'@'%' IDENTIFIED BY 'Password$1';
FLUSH PRIVILEGES;
USE sfjs;