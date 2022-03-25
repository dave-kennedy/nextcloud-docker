#!/usr/bin/env bash

cd /var/www/html

if [ ! -f config/config.php ]; then
    echo 'Installing Nextcloud...'

    php occ maintenance:install -n \
        --admin-user admin \
        --admin-pass admin \
        --database-name nextcloud
fi

echo 'Starting HTTP server...'
apache2-foreground

