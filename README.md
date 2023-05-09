# The error message:

![dvwa_error](https://github.com/0x01sudipta/dvwa-configure-php/assets/78684283/97d8271e-7166-44fa-b38e-4d6cc0754f69)


# dvwa-configure-php

This script enables you auto configure your php.ini file of DVWA running within a docker container.

Recently, I encountered an issue with a Docker container running DVWA (Damn Vulnerable Web Application). I needed to address a CSRF (Cross-Site Request Forgery) problem by modifying the php.ini configuration file. Since the application was running within a Docker container, editing the configuration file posed a challenge. After conducting some research, I discovered a solution and manually resolved the issue.

Realizing that newcomers to the field of penetration testing might encounter similar difficulties, I decided to create a bash script to automate the process. By running the provided script while using DVWA in a Docker container, the necessary modifications will be performed automatically. My intention is to save your valuable time and simplify the process.

# Usage:

Make sure DVWA is running into a docker conatiner and follow the commands given below-

git clone https://github.com/0x01sudipta/dvwa-configure-php.git

cd dvwa-configure-php

chmod +x dvwa-php-config-modify.sh 

./dvwa-php-config-modify.sh 
