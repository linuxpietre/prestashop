#!/bin/sh
sudo apt install apache2
sudo ufw allow in "Apache Full"
sudo service apache2 status
sudo service apache2 restart
sudo service apache2 stop
sudo service apache2 start
sudo mkdir -p /var/www/prestashop/
sudo chown -R $USER:$USER /var/www/prestashop
sudo chmod -R 755 /var/www/prestashop
> /etc/apache2/sites-available/prestashop.conf
cat <<+ >> /etc/apache2/sites-available/prestashop.conf
<VirtualHost *:80>
ServerAdmin admin@esempio.com
ServerName esempio.com
ServerAlias www.esempio.com
DocumentRoot /var/www/prestashop
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
+
sudo a2ensite prestashop.conf
sudo apache2ctl configtest
sudo systemctl restart apache2
sudo apt install mysql-server
sudo apt install php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
sudo service apache2 restart
cd /var/www/prestashop
