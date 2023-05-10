#!/bin/bash

# Retrieve container ID
container_id=$(sudo docker ps | awk '$0 ~ /dvwa/ {print $1}')

# Copy the php.ini file
sudo docker cp $container_id:/var/www/html/config/config.inc.php /tmp/

# Prompt the user for input
read -p "Enter the reCAPTCHA public key: " public_key
read -p "Enter the reCAPTCHA private key: " private_key

# Use sed to modify the config.inc.php file
sudo sed -i "s/\$_DVWA\[ 'recaptcha_public_key' \].*/\$_DVWA[ 'recaptcha_public_key' ] = '$public_key';/" /tmp/config.inc.php
sudo sed -i "s/\$_DVWA\[ 'recaptcha_private_key' \].*/\$_DVWA[ 'recaptcha_private_key' ] = '$private_key';/" /tmp/config.inc.php

# Copy back to the original source
sudo docker cp /tmp/config.inc.php $container_id:/var/www/html/config/config.inc.php

# Restart Apache2 for the changes to take effect
sudo docker exec $container_id /etc/init.d/apache2 reload

echo "Configuration file updated successfully."