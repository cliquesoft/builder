#!/bin/sh
# lsb2-install.sh	the install script for builder to /usr/local
#
# created	2025/10/09 by Dave Henderson (support@cliquesoft.org)
# updated	2026/03/05 by Dave Henderson (support@cliquesoft.org)




echo -en "\nChecking the effective UID:"		# check for root account priviledges
if [ $(id -u) -gt 0 ]; then				# checks that this ACTION is being run as an elevated account (e.g. as root or using sudo) so we don't have any issues getting the directories all setup
	echo " [failure]"
	echo
	echo -e "ERROR:"
	echo -e "This installation was executed without sufficient priviledges. Try using a"
	echo -e "different account or prefixing the call with 'sudo'.\n"
	exit 1
fi
echo " [done]"




echo -en "\nInstalling the software:"

cp -f bin/* /usr/local/bin

if [ ! -e /usr/local/etc/builder ]; then
	mkdir -p /usr/local/etc/builder || {
		echo " [failure]"
		echo
		echo -e "ERROR: The config directory (/usr/local/etc/builder) could not be created."
		exit 1
	}
fi
cp -f etc/builder/* /usr/local/etc/builder

if [ ! -e /usr/local/share/doc/builder ]; then
	mkdir -p /usr/local/share/doc/builder || {
		echo " [failure]"
		echo
		echo -e "ERROR: The doc directory (/usr/local/share/doc/builder) could not be created."
		exit 1
	}
fi
cp -fpL usr/local/share/doc/builder/* /usr/local/share/doc/builder
if [ ! -e /usr/local/man/man1 ]; then
	mkdir -p /usr/local/man/man1 || {
		echo " [failure]"
		echo
		echo -e "ERROR: The manual directory (/usr/local/man/man1) could not be created."
		exit 1
	}
fi
cp -fpL usr/local/man/man1/* /usr/local/man/man1

echo " [done]"
echo -e "\nCongrats! Your software is installed and ready for use!\n"
