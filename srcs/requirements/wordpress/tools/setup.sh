

# 
mkdir -p /var/www/html 
# read/write/execute for owner, read/execute for group and others
chmod -R 755 /var/www/html

# remove everything in the directory
rm -rf /var/www/html/*

# setuping the wp cli
cd /tmp && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
# move the wp cli to the bin directory
mv wp-cli.phar /usr/local/bin/wp

# download the wordpress
wp core download --path=/var/www/html --allow-root

# create the wp-config.php file


#line 23
sed -i -r "s/database_name_here/$db_name/1"   wp-config.php
#line 26
sed -i -r "s/username_here/$db_user/1"  wp-config.php
#line 29
sed -i -r "s/password_here/$db_pwd/1"    wp-config.php

sed -i -r "s/localhost/mariadb/1"    wp-config.php
