#!/bin/bash
set -e
# After copying the repo of your project
# run this script to run composer update
# and preform some basic required actions.

# if dir exist, do not produce an error (|| true)
mkdir /var/www/bootstrap/cache || true
mkdir /var/www/storage/framework/views || true
chown www-data:www-data -R /var/www
chmod 755 -R /var/www/storage

echo "running composer update"
/usr/local/bin/composer update --no-scripts
php /var/www/artisan migrate --force

echo "starting php5-fpm && nginx"
service php5-fpm start && nginx