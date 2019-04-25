set global validate_password_policy=0;
set global validate_password_length=1;
ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
create database discuz character set utf8 collate utf8_bin;
grant all privileges on discuz.* to discuz@localhost identified by '123456';
