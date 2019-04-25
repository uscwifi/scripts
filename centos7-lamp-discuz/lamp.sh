#!/bin/bash

#stop selinux and firewalld
stop_selinux(){
    bash ./iptables_selinux_stop.sh
}

#replace mirrors
replace_mirrors(){
    bash ./yum_replace.sh
}

#install httpd
install_httpd(){
    yum install httpd -y
    systemctl start httpd
    systemctl enable httpd

}

#install mysql5.7
install_mysql5.7(){
    rpm -Uvh https://dev.mysql.com/get/mysql80-community-release-el7-2.noarch.rpm
    yum install yum-utils -y
    sudo yum-config-manager --disable mysql80-community
    sudo yum-config-manager --enable mysql57-community
    yum makecache
    yum install mysql-community-server -y
    sleep 3
    systemctl start mysqld
    systemctl enable  mysqld
}

#install_php7.0
install_php7.0(){
    yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
    yum makecache
    yum install php70-php php70-php php70-php-bcmath php70-php-common php70-php-devel php70-php-fpm php70-php-gd php70-php-mbstring php70-php-mcrypt  php70-php-mysqlnd php70-php-pecl-memcache php70-php-pecl-memcached php70-php-xml -y
    systemctl start php70-php-fpm.service 
    systemctl enable php70-php-fpm.service
}

#change mysql pw and create database
ch_pw(){
    mysql -uroot -p$(grep "temporary password" /var/log/mysqld.log | awk '{print $NF}') --connect-expired-password < ./change_mysql_pw.sql
}

download_discuz(){
    yum install git -y
    git clone https://gitee.com/ComsenzDiscuz/DiscuzX.git
    cp  -a DiscuzX/upload /var/www/html/discuz    
    cp /var/www/html/discuz/config/config_global_default.php /var/www/html/discuz/config/config_global.php
    cp  /var/www/html/discuz/config/config_ucenter_default.php /var/www/html/discuz/config/config_ucenter.php
    chown apache -R /var/www/html/discuz
    rm -rf ./DiscuzX/
}

modify_httpd(){
    cp /etc/httpd/conf/httpd.conf{,_bak}
    sed -i '113r ./discuz-vhost.conf' /etc/httpd/conf/httpd.conf
    systemctl restart httpd 
}

main(){
    stop_selinux
    replace_mirrors
    install_httpd
    install_mysql5.7
    install_php7.0
    ch_pw
    download_discuz
    modify_httpd
}
main
