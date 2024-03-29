#!/bin/bash
clear
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
NUMBER_OF_CLIENTS=$(grep -c -E "^#&# " "/etc/xray/trojan.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "================================" | lolcat
		echo -e "  You have no existing clients!"
		exit 1
	fi

	echo ""
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ===============================" | lolcat
	echo "       No  Expired   User"
	echo " ===============================" | lolcat
        grep -E "^#&# " "/etc/xray/trojan.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^#&# " "/etc/xray/trojan.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#&# " "/etc/xray/trojan.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^#&# $user $exp/,/^},{/d" /etc/xray/trojan.json
sed -i "/^#&# $user $exp/,/^},{/d" /etc/xray/trojan.json
systemctl restart xray@trojan
service cron restart
clear
echo ""
echo -e "================================" | lolcat
echo -e "     Trojan Account Deleted     "
echo -e "================================" | lolcat
echo -e " Username  : $user"
echo -e " Expired   : $exp"
echo -e "===============================" | lolcat
echo -e "      Script By MakhlukVpn          "
echo -e "===============================" | lolcat
echo -e ""
