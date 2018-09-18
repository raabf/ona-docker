#!/bin/bash
#####################################
# Initialize config templates in ./www/local which is the Docker Volume for
# permanent config storage. Furthermore sets correct timezone. 
# Requires /etc/timezone to be mounted in the container.
# Run this command with docker exec after a new container has been created.
#####################################

ONA_BASE="$(head --lines=1 /etc/onabase)"

cp --no-clobber --recursive --verbose --target-directory="$ONA_BASE/www/local/" \
   $ONA_BASE/www/config/auth_ldap.config.php \
   $ONA_BASE/www/local.dist/*

chown --recursive --verbose www-data:www-data "$ONA_BASE/www/local"

echo "date.timezone = $(head --lines=1 /etc/timezone)" | tee "/usr/local/etc/php/conf.d/timezone.ini"

echo "DONE"
