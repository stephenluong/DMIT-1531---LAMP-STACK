#!/bin/bash

sudo echo '127.0.0.1 localhost
127.0.1.1 DMIT3FINAL
# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
192..168.99.2	site1.com
192..168.99.3	site2.com
192..168.99.4	site3.com
192..168.99.5	site4.com' > /etc/hosts

sudo echo '<VirtualHost 192.168.99.2>
DocumentRoot "/var/www/site1"
ServerName site1.com
<Directory "/var/www/site1">
allow from all
Options None
Require all granted
</Directory>
</VirtualHost>' > /etc/apache2/sites-available/site1.com.conf

sudo echo '<VirtualHost 192.168.99.3>
DocumentRoot "/var/www/site2"
ServerName site2.com
<Directory "/var/www/site2">
allow from all
Options None
Require all granted
</Directory>
</VirtualHost>' > /etc/apache2/sites-available/site2.com.conf 


sudo echo '<VirtualHost 192.168.99.4>
DocumentRoot "/var/www/site3"
ServerName site3.com
<Directory "/var/www/site3">
allow from all
Options None
Require all granted
</Directory>
</VirtualHost>' > /etc/apache2/sites-available/site3.com.conf 

sudo echo '<VirtualHost 192.168.99.5>
DocumentRoot "/var/www/site4"
ServerName site4.com
<Directory "/var/www/site4">
allow from all
Options None
Require all granted
</Directory>
</VirtualHost>' > /etc/apache2/sites-available/site4.com.conf 


sudo cd /var/apache2/sites-available/
#sudo a2ensite *
#service apache2 reload
sudo bash -c "a2ensite '*.conf' && a2dissite 000-default.conf default-ssl.conf && systemctl reload apache2.service"
systemctl reload apache2