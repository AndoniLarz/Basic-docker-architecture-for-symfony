#!/bin/bash

sed -i "s@listen = /run/php/php7.0-fpm.sock@listen = 9000@" /etc/php/7.0/fpm/pool.d/www.conf

# /bin/bash -l -c "php app/console redis:flushall --no-interaction"
# /bin/bash -l -c "php app/console giantswarm:temperature:add cologne 20"
# /bin/bash -l -c "php app/console giantswarm:temperature:add cologne 22"
# /bin/bash -l -c "php app/console giantswarm:temperature:add cologne 21"

exec /usr/sbin/php-fpm7.0 --nodaemonize