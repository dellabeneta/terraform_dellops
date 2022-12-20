sudo yum update -y
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd mariadb-server
sudo systemctl enable httpd
sudo systemctl enable mariadb
sudo systemctl start mariadb
sudo systemctl start httpd
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
sudo chmod 777 /var/www/html/
cp wordpress/wp-config-sample.php wordpress/wp-config.php
cp -r wordpress/* /var/www/html/
echo "create user wordpressuser@localhost identified by 'p4ssw0rd'" | mysql -u root
echo "create database wordpressdb" | mysql -u root
echo "grant all privileges on wordpressdb.* to wordpressuser@localhost" | mysql -u root
echo "flush privileges" | mysql -u root
wget https://terraform-infra-dellops.s3.amazonaws.com/wp-config.php
rm -f /var/www/html/wp-config.php
cp wp-config.php /var/www/html/