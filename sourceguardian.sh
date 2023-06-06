#!/bin/bash
# by Aria ;)
clear

version="$(curl https://aria.ws/sg.php)";

if [[ -d "/usr/local/sourceguardian/" ]]; then
	if grep -R 'zend_extension = /usr/local/sourceguardian/ixed.5.6.lin' "/usr/local/php56/lib/php.conf.d/90-custom.ini" > /dev/null 2>&1; then
		echo "Sourceguardian was already installed in PHP 5.6"
	fi
	if grep -R 'zend_extension = /usr/local/sourceguardian/ixed.7.2.lin' "/usr/local/php72/lib/php.conf.d/90-custom.ini" > /dev/null 2>&1; then
		echo "Sourceguardian was already installed in PHP 7.2"
	fi
	if grep -R 'zend_extension = /usr/local/sourceguardian/ixed.7.3.lin' "/usr/local/php73/lib/php.conf.d/90-custom.ini" > /dev/null 2>&1; then
		echo "Sourceguardian was already installed in PHP 7.3"
	fi
	if grep -R 'zend_extension = /usr/local/sourceguardian/ixed.7.4.lin' "/usr/local/php74/lib/php.conf.d/90-custom.ini" > /dev/null 2>&1; then
		echo "Sourceguardian was already installed in PHP 7.4"
	fi
	if grep -q $version "/usr/local/sourceguardian/version"; then
		echo -e "\nSourceguardian is updated.\n";
	else
		echo $version > /usr/local/sourceguardian/version
		echo -e "\nA new Sourceguardian version has been released : $version\n";

		echo -e "Sourceguardian download started.\n";

		mkdir -p /usr/local/sourceguardian/ > /dev/null 2>&1;
		echo "Create directory sourceguardian";

		curl --output /usr/local/sourceguardian/loaders.linux-x86_64.tar.gz https://www.sourceguardian.com/loaders/download/loaders.linux-x86_64.tar.gz > /dev/null 2>&1;
		echo "Download loader from sourceguardian";

		tar -xzf /usr/local/sourceguardian/loaders.linux-x86_64.tar.gz --directory /usr/local/sourceguardian/ > /dev/null 2>&1;
		echo "Extract loader file sourceguardian";

		chown -R root:root /usr/local/sourceguardian/
		echo "Change owner directory and file sourceguardian";

		chmod -R 0755 /usr/local/sourceguardian/
		echo "Change permission directory and file sourceguardian";

		sleep 2;
		echo -e "\nSourceguardian were downloaded.\n";
	fi
else
	echo -e "Sourceguardian download started.\n";

	mkdir -p /usr/local/sourceguardian/ > /dev/null 2>&1;
	echo "Create directory sourceguardian";

	curl --output /usr/local/sourceguardian/loaders.linux-x86_64.tar.gz https://www.sourceguardian.com/loaders/download/loaders.linux-x86_64.tar.gz > /dev/null 2>&1;
	echo "Download loader from sourceguardian";

	tar -xzf /usr/local/sourceguardian/loaders.linux-x86_64.tar.gz --directory /usr/local/sourceguardian/ > /dev/null 2>&1;
	echo "Extract loader file sourceguardian";

	chown -R root:root /usr/local/sourceguardian/
	echo "Change owner directory and file sourceguardian";

	chmod -R 0755 /usr/local/sourceguardian/
	echo "Change permission directory and file sourceguardian";

	sleep 2;
	echo -e "\nSourceguardian were downloaded.\n";

	echo -e "Sourceguardian install started.\n";

	if [[ -f "/usr/local/php56/lib/php.conf.d/90-custom.ini" ]]; then
		echo "zend_extension = /usr/local/sourceguardian/ixed.5.6.lin" >> /usr/local/php56/lib/php.conf.d/90-custom.ini
		echo "Sourceguardian is installed in PHP 5.6"
	fi
	if [[ -f "/usr/local/php72/lib/php.conf.d/90-custom.ini" ]]; then
		echo "zend_extension = /usr/local/sourceguardian/ixed.7.2.lin" >> /usr/local/php72/lib/php.conf.d/90-custom.ini
		echo "Sourceguardian is installed in PHP 7.2"
	fi
	if [[ -f "/usr/local/php73/lib/php.conf.d/90-custom.ini" ]]; then
		echo "zend_extension = /usr/local/sourceguardian/ixed.7.3.lin" >> /usr/local/php73/lib/php.conf.d/90-custom.ini
		echo "Sourceguardian is installed in PHP 7.3"
	fi
	if [[ -f "/usr/local/php74/lib/php.conf.d/90-custom.ini" ]]; then
		echo "zend_extension = /usr/local/sourceguardian/ixed.7.4.lin" >> /usr/local/php74/lib/php.conf.d/90-custom.ini
		echo "Sourceguardian is installed in PHP 7.4"
	fi

	echo -e "\nSourceguardian were installed.\n";
fi
