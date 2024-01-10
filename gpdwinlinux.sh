#!/bin/bash
if [ "$UID" != "0" ]; then
	echo "ERROR: NOT RUNNING AS ROOT!"
	echo "Please run this script as root to have it work correctly!"
	exit 2
fi
# Get current hardware, dmidecode
# board=$(dmidecode -t baseboard)
# Get current distro, in lowercase
distro=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
if [ "$distro" == "ubuntu" ]; then
	./ubuntu_winmax.sh
elif [ "$distro" == "fedora" ]; then
	./fedora.sh
elif [ "$distro" == "solus" ]; then
	./solus_winmax.sh
else
	# Throw an error for unrecognized distros. Derivative distros will likly do this, so give some error handling text.
	echo "Distro not recognized!"
	echo "If your distro uses \`apt', run: sudo ./ubuntu_winmax.sh"
	echo "If your distro uses \`dnf', run: sudo ./fedora_winmax.sh"
	echo "If your distro uses \`eopkg', run: sudo ./solus_winmax.sh"
	exit 2
fi

