CREATE DATABASE wordpress;
CREATE USER 'sfearow'@'%' IDENTIFIED BY '222';
GRANT ALL PRIVILEGES ON wordpress.* TO 'sfearow'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '123';