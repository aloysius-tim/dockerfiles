#!/bin/bash
apt-get update && apt-get install -y nginx
echo "daemon off;" >> /etc/nginx/nginx.conf
# echo "events { worker_connections 1024; }" >> /etc/nginx/nginx.conf

mkdir /var/log/nginx
touch /var/log/nginx/error.log
touch /var/log/nginx/access.log

rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/angular /etc/nginx/sites-enabled/default

npm install -gf angular-cli@latest @angular/tsc-wrapped typings typescript
