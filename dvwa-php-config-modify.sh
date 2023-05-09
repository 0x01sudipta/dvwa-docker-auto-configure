#!/bin/bash

# Retrieve container ID
container_id=$(sudo docker ps | awk '$0 ~ /dvwa/ {print $1}')

# Copy the php.ini file
sudo docker cp $container_id:/etc/php/7.0/apache2/php.ini /tmp/

# Edit lines 820 and 824: allow_url_fopen = On and allow_url_include = On
sudo sed -i 's/^\(allow_url_fopen = \).*/\1On/; s/^\(allow_url_include = \).*/\1On/' /tmp/php.ini

# Copy back to the original source
sudo docker cp /tmp/php.ini $container_id:/etc/php/7.0/apache2/php.ini

# Restart Apache2 for the changes to take effect
sudo docker exec $container_id /etc/init.d/apache2 reload
