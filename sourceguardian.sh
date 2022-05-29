#!/bin/bash
# by aria ;)

clear

# Sourceguardian download
echo "Sourceguardian download started.";
mkdir -p /usr/local/sourceguardian/ > /dev/null 2>&1;
wget -O /usr/local/sourceguardian/loaders.linux-x86_64.tar.gz http://www.sourceguardian.com/loaders/download/loaders.linux-x86_64.tar.gz > /dev/null 2>&1;
tar xzf /usr/local/sourceguardian/loaders.linux-x86_64.tar.gz > /dev/null 2>&1;
chmod -R 0755 /usr/local/sourceguardian/
echo -e "Sourceguardian were downloaded.\n";
sleep 2;

echo -e "Sourceguardian install started.\n";

if [[ -f "/usr/local/php56/lib/php.conf.d/90-custom.ini" ]]; then
    echo "zend_extension = /usr/local/sourceguardian/ixed.5.6.lin" >> /usr/local/php56/lib/php.conf.d/90-custom.ini
	echo "Install sourceguardian php 5.6"
elif [[ -f "/usr/local/php72/lib/php.conf.d/90-custom.ini" ]]; then
	echo "zend_extension = /usr/local/sourceguardian/ixed.7.2.lin" >> /usr/local/php72/lib/php.conf.d/90-custom.ini
	echo "Install sourceguardian php 7.2"
elif [[ -f "/usr/local/php73/lib/php.conf.d/90-custom.ini" ]]; then
	echo "zend_extension = /usr/local/sourceguardian/ixed.7.3.lin" >> /usr/local/php73/lib/php.conf.d/90-custom.ini
	echo "Install sourceguardian php 7.3"
elif [[ -f "/usr/local/php74/lib/php.conf.d/90-custom.ini" ]]; then
	echo "zend_extension = /usr/local/sourceguardian/ixed.7.4.lin" >> /usr/local/php74/lib/php.conf.d/90-custom.ini
	echo "Install sourceguardian php 7.4"
else
	echo "You are not using Directadmin"
fi

echo -e "Sourceguardian were installed.\n";
