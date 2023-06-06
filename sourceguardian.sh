#!/bin/bash
# by Aria ;)
clear

version="$(curl https://aria.ws/sg.php)";

// added by @CosmicNames
do_update_ini()
{
    INI_DIR="/usr/local/${1}/lib/php.conf.d";
    INI_FILE="${INI_DIR}/99-custom.ini";
    [ -f "${INI_FILE}" ] || INI_FILE="/usr/local/${1}/lib/php.conf.d/90-custom.ini";
    ROW="extension=${2}";

    if [[ -f "${INI_FILE}" ]]; then
		grep -m1 -q "^${ROW}" "${INI_FILE}" >/dev/null 2>&1 || echo "${ROW}" >> ${INI_FILE};
		echo "Sourceguardian is installed for PHP ${3}"
	else
		# Create the file if the directory exists
		if [[ -d "$INI_DIR" ]]; then
			touch ${INI_FILE}
			grep -m1 -q "^${ROW}" "${INI_FILE}" >/dev/null 2>&1 || echo "${ROW}" >> ${INI_FILE};
			echo "Sourceguardian is installed for PHP ${3}"
		fi
	fi
}

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

	do_update_ini 56 ixed.5.6.lin 5.6
	do_update_ini 72 ixed.7.2.lin 7.2
	do_update_ini 72 ixed.7.3.lin 7.3
	do_update_ini 74 ixed.7.4.lin 7.4
	do_update_ini 80 ixed.8.0.lin 8.0
	do_update_ini 81 ixed.8.1.lin 8.1

	echo -e "\nSourceguardian were installed.\n";
fi
