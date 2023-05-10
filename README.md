# DVWA Docker auto configure

These two scripts enable you auto configure /etc/php/7.0/apache2/php.ini file and /var/www/html/config/config.inc.php of DVWA running within a docker container.

Recently, I encountered an issue with a Docker container running DVWA (Damn Vulnerable Web Application). I needed to address a CSRF (Cross-Site Request Forgery) problem by modifying the php.ini configuration file. Since the application was running within a Docker container, editing the configuration file posed a challenge. After conducting some research, I discovered a solution and manually resolved the issue.

Realizing that newcomers to the field of penetration testing might encounter similar difficulties, I decided to create a bash script to automate the process. By running the provided script while using DVWA in a Docker container, the necessary modifications will be performed automatically. My intention is to save your valuable time and simplify the process.

# When to use:

To edit /etc/php/7.0/apache2/php.ini or /var/www/html/config/php.ini and make necessery changes.
and
To edit /var/www/html/config/config.inc.php and set private and public key to generate recapcha.


# How to use:

Make sure DVWA is running into a docker conatiner and run these commands given below into your host machine on which docker has been installed-

git clone https://github.com/0x01sudipta/dvwa-docker-auto-configure.git

cd dvwa-docker-auto-configure

chmod +x dvwa-php-config-modify.sh 

./dvwa-php-config-modify.sh 

chmod +x recapcha.sh

./recapcha.sh
