#!/bin/bash
# My Telegram : https://t.me/colongvpn
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/vless-tls.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "===============================" | lolcat
		echo "You have no existing clients!"
		echo -e "===============================" | lolcat
		exit 1
	fi

	clear
	echo -e "===============================" | lolcat
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo -e "===============================" | lolcat
	echo "     No  Expired   User"
	echo -e "===============================" | lolcat
	grep -E "^### " "/etc/xray/vless-tls.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^### " "/etc/xray/vless-tls.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/vless-tls.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/vless-tls.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/vless-nontls.json
systemctl restart xray@vless-tls
systemctl restart xray@vless-nontls
service cron restart
clear
echo ""
echo -e "===============================" | lolcat
echo -e "   XRAYS/Vless Account Deleted     "
echo -e "===============================" | lolcat
echo -e "  Username  : $user"
echo -e "  Expired   : $exp"
echo -e "===============================" | lolcat
echo -e "    Script By MakhlukVpn          "
echo -e "===============================" | lolcat
echo -e ""
