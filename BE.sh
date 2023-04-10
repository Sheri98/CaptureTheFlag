#! /bin/bash

function peda {
echo "[+] Welcome To Binary Exploitation Homekeeping"

test=$(cat ~/.gdbinit)
value="source /opt/peda/peda.py"
folder=""
if [[ "$test" = "$value" && -d "/opt/peda" ]]
then
	echo "peda is installed and configured"
elif [[ "$test" != "$value" && -d "/opt/peda/" ]]
then
	echo "peda is installed but not configured"
else
	peda=https://github.com/longld/peda.git
	sudo rm -r /opt/peda
	sudo git clone --quiet --depth=1  $peda  /opt/peda/
	sudo echo 'source /opt/peda/peda.py' > ~/.gdbinit
fi
}

function ghidra 
{
	if [ -f /usr/bin/ghidra ];
	then 
		echo "Ghidra is Installed"
	else
		echo "Ghirda is not installed"
		value=$(echo "want to install ghidra[Y/N]:")
		if [[ $value = 'Y' || $value='y' ]]
		then
			echo "[+] Installing Ghidra"
			sudo apt update
			sudo apt install ghidra
		else
			echo 'You have selected no to install ghidra'
		fi	
	fi
}
function main
{
	peda
	ghidra
}
main
